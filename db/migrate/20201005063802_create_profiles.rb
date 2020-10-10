class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :family_name,       null: false
      t.string :first_name,        null: false
      t.string :family_name_kana,  null: false
      t.string :first_name_kana,   null: false
      t.date   :birth_day,         null: false
      t.text   :introduction
      t.string :profile_image
      t.string :destination_family_name,       null: false
      t.string :destination_first_name,        null: false
      t.string :destination_family_name_kana,  null: false
      t.string :destination_first_name_kana,   null: false
      t.string :post_code,                    null: false
      t.string :prefecture,                    null: false
      t.string :city,                          null: false
      t.string :house_number,                  null: false
      t.string :building_name
      t.string :phone_number,                 unique:true
      t.references :user,                      null: false, foreign_key: true
      t.timestamps
    end
  end
end
