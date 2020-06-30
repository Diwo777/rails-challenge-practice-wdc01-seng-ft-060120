class Company < ApplicationRecord
    has_many :offices
    has_many :buildings, through: :offices
    has_many :employees
    accepts_nested_attributes_for :offices
    validates :name, presence: true
    
    
  def unique_buildings
    self.buildings.uniq
  end

  def office_floors
    self.offices
  end

  def total_rent
    rent = 0
    self.buildings.each do |building|
      rent += building.rent_per_floor
    end 
    rent
  end 

end
 