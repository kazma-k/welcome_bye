class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable,
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         # :confirmable, :trackable and :omniauthable
  has_many :posts
end
