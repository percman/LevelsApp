class CreatePointTotals < ActiveRecord::Migration[5.0]
  def change
    create_table :point_totals do |t|
      t.belongs_to :student, index: true
      t.date :date
      t.integer :score
      t.boolean :absent

      t.timestamps
    end
  end
end
