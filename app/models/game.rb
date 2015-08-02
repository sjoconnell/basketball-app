class Game < ActiveRecord::Base
  belongs_to :user
  has_many :gamed_users

  validates :title, presence: true
  validates :address, presence: true
  validates :players_allowed, presence: true
  validates :players_allowed, numericality: true

end
