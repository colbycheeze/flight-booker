class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.references :passenger, index: true
      t.references :booking, index: true

      t.timestamps
    end
  end
end
