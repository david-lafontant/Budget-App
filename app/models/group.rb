class Group < ApplicationRecord
  belongs_to :user
  has_many :expenditures

  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
end
