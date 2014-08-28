require "spec_helper"

describe Sighting do
  it { should belong_to :specie }
  it { should validate_presence_of :date }
  it { should validate_presence_of :specie_id }
  it { should validate_numericality_of :latitude }
  it { should validate_numericality_of :longitude }
end
