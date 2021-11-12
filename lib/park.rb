class Park
  attr_reader :name, :admission_cost, :vehicles

  def initialize(name, admission_cost)
    @name = name
    @admission_cost = admission_cost
    @vehicles = []
  end

  def add_vehicle(new_vehicle)
    @vehicles.push(new_vehicle)
  end

  def passenger_list
    # @vehicles.flat_map(&:passengers)
    @vehicles.flat_map{ |vehicle| vehicle.passengers }
  end

  def revenue_generated
    passenger_list.count{ |passenger| passenger.adult? } * @admission_cost
    # passenger_list.count(&:adult?) * @admission_cost
  end
end