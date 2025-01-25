class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :trackable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
end
