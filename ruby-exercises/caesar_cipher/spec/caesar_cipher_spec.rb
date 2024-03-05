# frozen_string_literal: true

require "./caesar_cipher"

describe "Caesar Cipher" do
  it "returns a string with the each character shifted forward several places in the alphabet" do
    expect(caesar_cipher("ABC", 5)).to eql("FGH")
  end

  it "is case sensitive" do
    expect(caesar_cipher("aBc", 5)).to eql("fGh")
  end

  it "does not mutate non-alphabetical characters" do
    expect(caesar_cipher("ABC123!", 5)).to eql("FGH123!")
  end

  it "accepts a negative shift value" do
    expect(caesar_cipher("ABC", -5)).to eql("VWX")
  end

  it "ignores spaces" do
    expect(caesar_cipher("A B C ", 5)).to eql("F G H ")
  end
end
