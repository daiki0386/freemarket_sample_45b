 *** DB設計 ***

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, index: true|
|email|string|null: false, index: true, unique: true|
|introduction|text|

## Association
has_many :likes
has_many :product_comments
has_many :purchases
has_many :products
has_one :profiles
has_one :addresses
has_one :credit_cards


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
belongs_to :user


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
belongs_to :user
belongs_to :area


## areasテーブル
|Column|Type|Options|
|------|----|-------|
|prefecture|string|null: false|

## Association
has_many :addresses
has_many :products


## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|payment_card_no|integer|null: false|
|expire_month|integer|null: false|
|expire_year|integer|null: false|
|security_code|integer|null: false|
|user_id|references|null: false, foreign_key: true|

## Association
belongs_to :user


## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|

## Association
belongs_to :user
belongs_to :product


## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|description|text|null: false|
|price|integer|null: false|
|area_id|references|null: false, foreign_key: true|
|condition_id|references|null: false, foreign_key: true|
|product_size_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|
|delivery_method_id|references|null: false, foreign_key: true|
|estimated_date_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

## Association
belongs_to :area
belongs_to :condition
belongs_to :product_size
belongs_to :brand
belongs_to :delivery_method
belongs_to :estimated_date
belongs_to :user
has_many :product_images
has_many :categories, through: :category_products
has_many :category_products


## products_imageテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|references|null: false, foreign_key: true|
|image|string|null: false|

## Association
belongs_to :product


## conditionsテーブル
|Column|Type|Options|
|------|----|-------|
|status|string|null: false|

## Association
has_many :products


## product_sizesテーブル
|Column|Type|Options|
|------|----|-------|
|size|string|null: false|

## Association
has_many :products


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|parent|references|null: false, foreign_key: true|

## Association
has_many :products, through: :category_products
has_many :category_products
belongs_to :parent_id, class_name: "Category"
has_many :childern, class_name: "Category", foreign_key: :parent_id


## category_productsテーブル
|Column|Type|Options|
|------|----|-------|
|category_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|

## Association
belongs_to :category
belongs_to :product


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

## Association
has_many :products


## delivery_methodsテーブル
|Column|Type|Options|
|------|----|-------|
|way|string|null: false|

## Association
has_many :products


## estimated_datesテーブル
|Column|Type|Options|
|------|----|-------|
|day|string|null: false|

## Association
has_many :products


## product_commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|

## Association
belongs_to :user
belongs_to :product


## purchasesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|

## Association
belongs_to :user
belongs_to :product
