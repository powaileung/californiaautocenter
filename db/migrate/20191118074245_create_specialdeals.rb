class CreateSpecialdeals < ActiveRecord::Migration[5.2]
  def change
    create_table :specialdeals do |t|
      t.string :title
      t.decimal :cost
      t.text :description
      t.text :disclaimer
      t.integer :user_id
      t.timestamps
    end
    add_index :specialdeals, :user_id
  end
end
