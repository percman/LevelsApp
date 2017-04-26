class Homeroom < ApplicationRecord
  has_many :students, dependent: :nullify
  accepts_nested_attributes_for :students
  validates :name, presence: true
end
