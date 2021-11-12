require_relative '../lib/passenger'
require_relative '../lib/vehicle'
require_relative '../lib/park'

RSpec.describe Park do 
  let(:civic)   { Vehicle.new('2001', 'Honda', 'Civic') }
  let(:element) { Vehicle.new('1999', 'Honda', 'Element') }
  let(:camry)   { Vehicle.new('2020', 'Toyota', 'Camry') }
  let(:modelt)  { Vehicle.new('1910', 'Ford', 'Model T') }

  let(:charlie) { Passenger.new({"name" => "Charlie", "age" => 18}) }
  let(:jude)    { Passenger.new({"name" => "Jude", "age" => 20}) }
  let(:taylor)  { Passenger.new({"name" => "Taylor", "age" => 12}) }
  let(:viv)     { Passenger.new({"name" => "Viv", "age" => 17}) }
  let(:liz)     { Passenger.new({"name" => "Liz", "age" => 30}) }

  let(:park)    { Park.new('Rocky Mountain', 10) }


  describe '#initialize' do
    it 'exists' do
      expect(park).to be_a(Park)
    end

    it 'has attributes' do
      expect(park.name).to eq('Rocky Mountain')
      expect(park.admission_cost).to eq(10)
      expect(park.vehicles).to eq([])
    end
  end

  describe '#add_vehicle' do
    it 'can add vehicles to the vehicle list' do
      park.add_vehicle(civic)
      park.add_vehicle(element)
      park.add_vehicle(camry)
      park.add_vehicle(modelt)
      
      expect(park.vehicles).to eq([civic, element, camry, modelt])
    end
  end
  
  describe '#passenger_list' do
    it 'can return the passengers that entered the park in a vehicle' do
      civic.add_passenger(charlie)
      element.add_passenger(jude)
      element.add_passenger(taylor)
      camry.add_passenger(viv)
      camry.add_passenger(liz)

      park.add_vehicle(civic)
      park.add_vehicle(element)
      park.add_vehicle(camry)
      
      expect(park.passenger_list).to eq([charlie, jude, taylor, viv, liz])
    end
  end
  
  describe '#revenue_generated' do
    it 'can return the total revenue generated from adult entrants' do
      civic.add_passenger(charlie)
      element.add_passenger(jude)
      element.add_passenger(taylor)
      camry.add_passenger(viv)
      camry.add_passenger(liz)
    
      park.add_vehicle(civic)
      park.add_vehicle(element)
      park.add_vehicle(camry)

      expect(park.revenue_generated).to eq(30)
    end
  end
end