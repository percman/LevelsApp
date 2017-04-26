class Homeroom < ApplicationRecord
  has_many :students
  accepts_nested_attributes_for :students
  validates :name, presence: true
end
