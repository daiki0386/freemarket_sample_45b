class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.references :user,          null: false, foreign_key: true
      t.references :product,       null: false, foreign_key: true
      t.integer    :total_payment, null: false
      t.timestamps
    end
  end
end
