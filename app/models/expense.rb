class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
end