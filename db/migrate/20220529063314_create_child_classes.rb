class CreateChildClasses < ActiveRecord::Migration[6.0]
  def change
    create_table :child_classes do |t|
      t.integer :class_age,      null: false, unique: true
      t.string :class_name,      null: false, unique: true

      t.timestamps
    end
  end
end
