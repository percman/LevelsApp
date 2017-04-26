class AddTypeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :type, :string
    add_reference :users, :student, foreign_key: true
  end
end
