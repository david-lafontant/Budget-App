class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :email, presence: true
  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  
  has_many :groups, dependent: :destroy
  has_many :expenditures, dependent: :destroy
end
