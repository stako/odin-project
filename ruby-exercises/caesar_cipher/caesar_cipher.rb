# frozen_string_literal: true

def caesar_cipher(message, offset) # rubocop:disable Metrics/MethodLength
  cipher = ""

  message.each_char do |char|
    ord = char.ord

    #  65 == A
    #  90 == Z
    #  97 == a
    # 122 == z

    # apply offset only to alphabetical characters (skip spaces, punctuation, etc)
    if ord.between?(65, 90) || ord.between?(97, 122)
      # loop from Z to A (or A to Z when offset is negative)
      base = ord < 91 ? 65 : 97
      adjusted_ord = ((ord - base + offset) % 26) + base

      cipher += adjusted_ord.chr
    else
      cipher += char
    end
  end

  cipher
end
