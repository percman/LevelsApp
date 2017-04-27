class PointTotal < ApplicationRecord
  belongs_to :student
  validates :score, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100}, unless: :absent?
  validates :score, presence: true, unless: :absent?
  validates :date, uniqueness: {:scope=> :student_id}
  validates :date, date: {before_or_equal_to: Proc.new{Date.today}}, on: :create
  validates :date, date: true

  def successful
    if absent?
      return nil
    end
    if (student.level=='1' && score>=70) || ((student.level=='2'||student.level=='OR')&&score>=80)||(student.level=='3'&& score>=85)
      return "yes"
    elsif score>=85
      return "yes"
    else
      return "no"
    end
  end

  def attendance
    if absent?
      return "Absent"
    end
  end

end