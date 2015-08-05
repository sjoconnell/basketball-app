class Profile < ActiveRecord::Base
  belongs_to :user

  mount_uploader :image, ImageUploader

  validates :first_name, presence: true
  validates :last_name, presence: true

end
