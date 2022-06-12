class CreateGrowths < ActiveRecord::Migration[6.0]
  def change
    create_table :growths do |t|
      t.string :month,          null: false   
      t.date :inspection_date,  null: false   
      t.float	 :weight,         null: false 
      t.float	 :height,         null: false 
      t.references :kid,        null: false   

      t.timestamps
    end
  end
end
