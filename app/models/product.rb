class Product < ActiveRecord::Base
  belongs_to :user

  #VALID_IMAGE_URL_REGEX = /^[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?(png|gif|jpg)$/
  VALID_IMAGE_URL_REGEX = /\A(https?:\/\/){1}[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?[^\.](\.png|\.gif|\.jpg)\z/ix
  validates :title, :description, :price, :user_id, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :price, numericality: { less_than_or_equal_to: 999999.99, message:"too high. Nobody will buy it."}
  validates :title, length: {minimum: 3, message: "too short. Must be at least 5 characters long." }
  validates :image_file, allow_blank:true, format: {with: VALID_IMAGE_URL_REGEX, message: 'must be a URL for GIF, JPG or PNG image.' }
end
