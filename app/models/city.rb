class City < ApplicationRecord
  belongs_to :state
  has_many :areas
  validates :name, uniqueness: true
  validates_presence_of :name
end
