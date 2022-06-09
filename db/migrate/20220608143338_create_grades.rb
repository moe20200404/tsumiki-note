class CreateGrades < ActiveRecord::Migration[6.0]
  def change
    create_table :grades do |t|
      t.integer :age,      null: false
      t.string :name,      null: false, unique: true

      t.timestamps
    end
  end
end
