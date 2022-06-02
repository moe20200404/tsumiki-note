class CreateChildren < ActiveRecord::Migration[6.0]
  def change
    create_table :children do |t|
      t.string :name,         null: false
      t.date :birth_date,     null: false
      t.integer :gender_id,   null: false
      t.string :start_month,  null: false
      t.string :end_month  
      t.references :class_id, null: false
      t.references :user_id

      t.timestamps
    end
  end
end
