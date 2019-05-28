class Shop < ApplicationRecord
	mount_uploader :imageshop, ImageUploader
	belongs_to :user
	has_many :products
	belongs_to :registeration_number, required: false
end
