class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :introduction, null: false
      t.string :category, null: false
      t.string :brand_id
      t.string :item_condition, null: false
      t.string :postage_payer, null: false
      t.string :prefecture, null: false
      t.string :preparation_period, null: false
      t.timestamps
    end
  end
end
