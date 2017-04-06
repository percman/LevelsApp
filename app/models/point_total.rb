class PointTotal < ApplicationRecord
  belongs_to :student
  validates :score, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100}, allow_nil: true
  validates :date, uniqueness: {:scope=> :student_id}
  validates :date, date: {before_or_equal_to: Proc.new{Date.today}}, on: :create
  validates :date, date: true

  def successful
    if absent?
      return nil
    elsif score==nil
      self.score=0
    end
    if (student.level=='1' && score>=70) || ((student.level=='2'||student.level=='OR')&&score>=80)||(student.level=='3'&& score>=85)
      return "yes"
    elsif score>=85
      return "yes"
    else
      return "no"
    end
  end

end