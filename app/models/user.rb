class User < ActiveRecord::Base
  has_many :games
  has_one :profile
  has_many :gamed_users

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
