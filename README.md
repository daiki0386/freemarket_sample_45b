 *** DB設計 ***

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, index: true|
|email|string|null: false, index: true, unique: true|
|introduction|text|

## Association
- has_many :likes
- has_many :product_comments
- has_many :purchases
- has_many :products
- has_one :profiles
- has_one :addresses
- has_one :credit_cards


## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|user_id|references|null: false, foreign_key: true|

## Association
- belongs_to :user


## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|zip_code|integer|null: false|
|area_id|references|null: false, foreign_key: true|
|city|string|null: false|
|address1|string|null: false|
|address2|string|
|user_id|references|null: false, foreign_key: true|

## Association
- belongs_to :user
- belongs_to :area


## areasテーブル
|Column|Type|Options|
|------|----|-------|
|prefecture|string|null: false|

## Association
- has_many :addresses
- has_many :products

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|

## Association
- belongs_to :user
- belongs_to :product


## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|description|text|null: false|
|price|integer|null: false|
|area_id|references|null: false, foreign_key: true|
|condition|integer|null: false, enum|
|product_size_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|
|shipping_method|integer|null: false, enum|
|shipping_burden|integer|null: false, enum|
|estimated_date|integer|null: false, enum|
|user_id|references|null: false, foreign_key: true|

## Association
- belongs_to :area
- belongs_to :product_size
- belongs_to :brand
- belongs_to :user
- has_many :product_images
- belongs_to :category


## products_imageテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|references|null: false, foreign_key: true|
|image|text|null: false|

## Association
- belongs_to :product


## product_sizesテーブル
|Column|Type|Options|
|------|----|-------|
|size|string|null: false|

## Association
- has_many :products


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|main_category|references|null: true, index:true|
|sub_category|references|null: true, index:true|

## Association
- has_many :products
- has_many :category, class_name: "Category",foreign_key: "main_category_id"
- has_many :category, class_name: "Category",foreign_key: "sub_category_id"
- belongs_to :main_category, class_name: "Category"
- belongs_to :sub_category, class_name: "Category"

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

## Association
- has_many :products


## product_commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|

## Association
- belongs_to :user
- belongs_to :product


## purchasesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|
|total_payment|integre|null: false|

## Association
- belongs_to :user
- belongs_to :product
