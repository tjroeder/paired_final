require_relative '../lib/passenger'

RSpec.describe Passenger do 
  let(:charlie) { Passenger.new({"name" => "Charlie", "age" => 18}) }
  let(:taylor) { Passenger.new({"name" => "Taylor", "age" => 12}) }

  describe '#initialize' do
    it 'exists' do
      expect(charlie).to be_a(Passenger)
    end

    it 'has attributes' do
      expect(charlie.name).to eq('Charlie')
      expect(charlie.age).to eq(18)
      expect(charlie.driver).to eq(false)
    end
  end

  describe '#adult?' do
    it 'can not be an adult' do
      expect(taylor.adult?).to eq(false)
    end

    it 'can be an adult?' do
      expect(charlie.adult?).to eq(true)
    end
  end

  describe '#drive' do
    it 'can change #driving attribute' do
      expect(charlie.driver).to eq(false)
      charlie.drive
      expect(charlie.driver).to eq(true)
    end
  end

  describe '#driver?' do
    it 'is initially not driving status' do
      expect(charlie.driver?).to eq(false)
    end

    it 'can drive status' do
      charlie.drive
      expect(charlie.driver?).to eq(true)
    end
  end
end
