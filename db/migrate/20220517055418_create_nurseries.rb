class CreateNurseries < ActiveRecord::Migration[6.0]
  def change
    create_table :nurseries do |t|
      t.string :nursery_name, null: false

      t.timestamps
    end
  end
end
