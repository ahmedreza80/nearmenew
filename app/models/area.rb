class Area < ApplicationRecord
    belongs_to :city
    validates :name, uniqueness: true
    validates_presence_of :name
end
