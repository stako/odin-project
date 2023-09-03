# frozen_string_literal: true

require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
end

def clean_phone_number(phone)
  clean_number = phone.delete('^0-9')
  clean_number.delete_prefix!('1') if clean_number.length == 11
  clean_number = nil unless clean_number.length == 10
  clean_number
end

def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    civic_info.representative_info_by_address(
      address: zip,
      levels: 'country',
      roles: %w[legislatorUpperBody legislatorLowerBody]
    ).officials
  rescue
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

def save_thank_you_letter(id, form_letter)
  Dir.mkdir('output') unless Dir.exist?('output')

  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end

puts 'Event Manager Initialized'

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

template_letter = File.read('form_letter.erb')
erb_template = ERB.new template_letter

regd_by_hour = Hash.new(0)
regd_by_day = Hash.new(0)

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  phone = clean_phone_number(row[:homephone])

  zipcode = clean_zipcode(row[:zipcode])

  legislators = legislators_by_zipcode(zipcode)

  form_letter = erb_template.result(binding)

  save_thank_you_letter(id, form_letter)

  regi_time = Time.strptime(row[:regdate], '%m/%e/%y %k:%M')
  regd_by_hour[regi_time.hour] += 1
  regd_by_day[regi_time.wday] += 1
end

most_active_hour = regd_by_hour.max_by { |_, value| value }[0]
puts "Most active hour: #{most_active_hour}"

day_string = %w[Sunday Monday Tuesday Wednesday Thursday Friday]

most_active_day = regd_by_day.max_by { |_, value| value }[0]
puts "Most active day: #{day_string[most_active_day]}"
