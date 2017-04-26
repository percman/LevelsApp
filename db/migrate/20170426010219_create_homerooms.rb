class CreateHomerooms < ActiveRecord::Migration[5.0]
  def change
    create_table :homerooms do |t|
      t.string :name

      t.timestamps
    end
  end
end
