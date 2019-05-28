class RegisterationNumber < ApplicationRecord
	before_save :generate_code
	belongs_to :user
	has_many :shops
	
	private
	def generate_code
    self.code = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless self.class.where(code: random_token).exists?
    end
  end
end
