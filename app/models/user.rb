class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :wikis
  has_many :collaborators
  has_many :wikis, through: :collaborators

  def my_wikis
		#SELECT "wikis".* FROM "wikis" WHERE "wikis"."user_id" = ?  [["user_id", 1]]
	end
end
