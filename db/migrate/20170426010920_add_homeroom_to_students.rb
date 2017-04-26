class AddHomeroomToStudents < ActiveRecord::Migration[5.0]
  def change
    add_reference :students, :homeroom, foreign_key: true
  end
end
