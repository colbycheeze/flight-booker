class CreatePassengers < ActiveRecord::Migration
  def change
    create_table :passengers do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
    add_index :passengers, :email, unique: true
  end
end
