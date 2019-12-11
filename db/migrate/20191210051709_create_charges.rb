class CreateCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :charges do |t|
      t.integer :user_id
      t.integer :specialdeal_id
      t.integer :cost
      t.timestamps
    end
    add_index :charges, [:user_id, :specialdeal_id, :cost]
    add_index :charges, :specialdeal_id
  end
end