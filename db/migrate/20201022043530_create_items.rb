class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :introduction, null: false
      t.integer :category, null: false
      t.string :brand_id
      t.integer :item_condition, null: false
      t.integer :postage_payer, null: false
      t.integer :prefecture, null: false
      t.integer :preparation_period, null: false
      t.references :user, foreign_key: true
      t.integer :purchase, foreign_key: true
      t.timestamps
    end
  end
end
