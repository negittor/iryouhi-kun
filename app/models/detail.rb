class Detail < ApplicationRecord
  validates :date, presence: true
  validates :user, presence: true
  validates :department,
    presence: true,
    length: {maximum: 10}
  validates :payment,
    presence: true,
    numericality: {only_integer: true, greater_than: 0 }
end
