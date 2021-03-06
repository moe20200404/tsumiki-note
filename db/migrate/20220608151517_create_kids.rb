class CreateKids < ActiveRecord::Migration[6.0]
  def change
    create_table :kids do |t|
      t.string :name,          null: false    
      t.date :birth_date,      null: false        
      t.integer :gender_id,    null: false          
      t.string :start_month,   null: false          
      t.string :end_month             
      t.references :grade,  null: false            
      t.references :user,   null: false         
      t.timestamps
    end
  end
end
