require 'rspec'
require_relative '../lib/passenger'
require_relative '../lib/vehicle'

RSpec.describe Vehicle do 
  let(:vehicle) { Vehicle.new('2001', 'Honda', 'Civic') }
  let(:charlie) { Passenger.new({"name" => "Charlie", "age" => 18}) }
  let(:jude) { Passenger.new({"name" => "Jude", "age" => 20}) }
  let(:taylor) { Passenger.new({"name" => "Taylor", "age" => 12}) }

  describe '#initialize' do
    it 'exists' do
      expect(vehicle).to be_a(Vehicle)
    end

    it 'has attributes' do
      expect(vehicle.year).to eq('2001')
      expect(vehicle.make).to eq('Honda')
      expect(vehicle.model).to eq('Civic')
      expect(vehicle.speeding).to eq(false)
      expect(vehicle.passengers).to eq([])
    end
  end

  describe '#speeding?' do
    it 'is not speeding initially' do
      expect(vehicle.speeding?).to eq(false)
    end

    it 'it can start speeding' do
      vehicle.speed
      expect(vehicle.speeding?).to eq(true)
    end
  end

  describe '#add_passenger' do
    it 'can add passenger to passengers array' do
      vehicle.add_passenger(charlie)
      vehicle.add_passenger(jude)
      vehicle.add_passenger(taylor)
      
      expect(vehicle.passengers).to eq([charlie, jude, taylor])
    end
  end
  
  describe '#num_adults' do
    it 'can return the number of adults in the car' do
      expect(vehicle.num_adults).to eq(0)
      vehicle.add_passenger(charlie)
      expect(vehicle.num_adults).to eq(1)
      vehicle.add_passenger(jude)
      expect(vehicle.num_adults).to eq(2)
      vehicle.add_passenger(taylor)
      expect(vehicle.num_adults).to eq(2)
    end
  end

  # describe 'iteration 3' do
  #   describe '#' do

  #   end
  # end
end