# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Flea Market app DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, add_index: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|password_confirmation|string|null: false|
### Association
- has_many :comments
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
### Association
- belongs_to :user

## destinations テーブル		
|Column|Type|Options|
|------|----|-------|
|destination_family_name|string|null: false|
|destination_first_name|string|null: false|
|destination_family_name_kana|string|null: false|
|destination_first_name_kana|string|null: false|
|post_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|
|phone_number|integer|unique:true|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## credit_cards テーブル		
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key:true|
|card_number|integer|null: false, unique:true|
|validity_year|integer|null: false|
|validity_month|integer|null: false|
|security_code|integer|null: false|
### Association
- belongs_to :user

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|
### Association
- has_many :users
- has_many :items

## items テーブル		
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|introduction|text|null: false|
|category|references|null: false, foreign_key: true|
|brand|text|	
|item_condition|integer|null: false|
|postage_payer|integer|null: false|
|prefecture|integer|null: false|
|preparation_period|integer|null: false|
|shipping_method|integer|	
|seller|references|null: false, foreign_key: true|
|buyer|references|foreign_key: true|
### Association
- belongs to :users
- has_many :categories, through: :items_categories
- has_many :item_images

## categories テーブル		
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :items, through: :items_categories


## items_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|items_id|integer|null: false, foreign_key: true|
|categories_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item|references|null: false, foreign_key: true|
### Association
- belongs_to :item