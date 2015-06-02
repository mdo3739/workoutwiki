class Wiki < ActiveRecord::Base
	belongs_to :user
  has_many :users, through: :collaborators
  has_many :collaborators

  validates :title, presence: true
	validates :body, presence: true
	validates :user_id, presence: true
	
end
