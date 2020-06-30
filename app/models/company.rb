class Company < ApplicationRecord
    has_many :offices
    has_many :buildings, through: :offices
    has_many :employees
    
  def unique_buildings
    self.buildings.uniq
  end

  def office_floors
    self.offices
  end

end
 