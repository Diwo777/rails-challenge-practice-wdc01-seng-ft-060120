class Office < ApplicationRecord
    belongs_to :building
    belongs_to :company
    validates :building_id, presence: true
    validates :company_id, presence: true
    validates :floor, presence: true, numericality: { only_integer: true }
end
