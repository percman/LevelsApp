class Student < ApplicationRecord
  has_many :point_totals, dependent: :destroy
  has_one :user, dependent: :destroy
  belongs_to :homeroom, optional: true
  validates :last_name, :first_name, :level, :level_start_date, presence: true
  validates :level_start_date, date: true
  accepts_nested_attributes_for :point_totals, :user
  def last_first
    "#{last_name}, #{first_name}"
  end

  def earn_level
    if level=='1' || level=='OR'
      must_succeed=5
      out_of=7
    elsif level=='2'
      must_succeed=10
      out_of=14
    elsif level=='3'
      must_succeed=17
      out_of=21
    elsif level=='4'
      must_succeed=25
      out_of=28
    else return 'N/A'
    end
    return solve(must_succeed, out_of)
  end

  def keep_level
    out_of=7
    if level=='1' ||level=='OR'||level=='5B'
      return 'N/A'
    elsif level=='2'
      must_succeed=4
    elsif level=='3'
      must_succeed=5
    elsif level=='4'||level=='5'
      must_succeed=6
    end
    return solve(must_succeed, out_of)
  end

  def solve(must_succeed, out_of)
    recent=Student.joins(:point_totals)
    recent=recent.where("student_id=? AND date>=? AND absent=?", self.id, self.level_start_date, false)
    count=recent.count
    if count<out_of
      return "TBD"
    end
    earliest=recent.order('date desc').offset(out_of-1).limit(1).pluck(:date).first
    success=recent.where("date>=?",earliest)
    success=success.where("level='1' AND score >=70").or(success.where("level='2' AND score>=80")).or(success.where("level='OR' AND score >=80")).or(success.where("level='3' AND score>=85")).or(success.where("score>=90"))
    success_count=success.count
    if must_succeed>success_count
      return "No"
    else
      return "Yes"
    end
  end
end
