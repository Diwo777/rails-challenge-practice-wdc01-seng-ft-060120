class Building < ApplicationRecord
  has_many :offices
  has_many :companies, through: :offices

  def number_of_floors_available
    # Will not work until relationships and schema are corretly setup

    all_floors = Array(1..self.number_of_floors)
    self.offices.each do |office|
      all_floors.delete(office.floor)
    end
    all_floors
  end

  def empty_offices
    number_of_floors_available.map { |f| offices.build(floor: f) }
  end

  def unique_companies 
    self.companies.uniq
  end 

  def total_rent
    # rent_per_floor 18000
    # number_of_floors - number_of_floors_available.count = number_of_floors_taken 
    # 8 - 1 = 7
    # rent_per_floor * number_of_floors_taken = total_rent 
    number_of_floors_taken = self.number_of_floors - self.number_of_floors_available.count 
    total = rent_per_floor * number_of_floors_taken
    total 
  end 

end
