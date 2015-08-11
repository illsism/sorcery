class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :products, dependent: :destroy
  before_save { self.email = email.downcase }
  mount_uploader :picture, PictureUploader


  validates :password, presence: true, length: { minimum:3 }, confirmation: true, if: :new_user?


  validates :email, uniqueness: true, email_format: { message: 'has invalid format' }

  validates :name, presence: true, length: { minimum:4 }

  validate :picture_size

  private

  def new_user?
    new_record?
  end

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end

end
