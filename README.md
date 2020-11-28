# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, add_index: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|password_confirmation|string|null: false|
### Association
- has_many :items

## profiles テーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_day|date|null: false|
|introduction|text|	
|profile_image|string|
|user_id|references|null: false, foreign_key: true|
|destination_family_name|null: false|
|destination_first_name|null: false|
|destination_family_name_kana|null: false|
|destination_first_name_kana|null: false|
|post_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|
|phone_number|string|unique:true|
### Association
- belongs_to :user

## credit_cards テーブル		
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key:true|
|customer_id|string|null: false|
|card_id|integer|null: false|
### Association
- belongs_to :user


## items テーブル		
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|introduction|text|null: false|
|category_id|references|null: false, foreign_key: true|
|brand_id|string|
|item_condition|integer|null: false|
|postage_payer|integer|null: false|
|prefecture|integer|null: false|
|preparation_period|integer|null: false|
|shipping_method|integer|	
|user_id|references|null: false, foreign_key: true|
|purchase|integer|
### Association
- belongs to :user
- belongs to :category
- has_many :images

## categories テーブル		
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|
### Association
- has_many :items
- has_ancestry


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|src|string|null: false|
### Association
- belongs_to :item

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

