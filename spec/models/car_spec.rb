require "rails_helper"

RSpec.describe Car, type: :model do
  subject {
    described_class.new(
      make: "BMW",
      model: "320i xdrive",
      year: "2013"
    )
  }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a make" do
    subject.make = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a model" do
    subject.model = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a year" do
    subject.year = nil
    expect(subject).to_not be_valid
  end
end
