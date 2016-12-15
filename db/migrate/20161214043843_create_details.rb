class CreateDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :details do |t|
      t.date :date
      t.string :user
      t.string :department
      t.integer :payment

      t.timestamps
    end
  end
end
