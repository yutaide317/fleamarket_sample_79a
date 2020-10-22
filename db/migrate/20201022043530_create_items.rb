class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :introduction, null: false
      t.string :category, null: false 　#readme修正？
      t.string :brand_id #null: falseではない　#readme修正
      t.string :item_condition, null: false #readme修正
      t.string :postage_payer, null: false #readme修正
      t.string :prefecture, null: false #readme修正
      t.string :preparation_period, null: false #readme修正
      t.timestamps
    end
  end
end
