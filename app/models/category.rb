class Category < ApplicationRecord
  has_many :category, class_name: "Category",foreign_key: "main_category_id"
  has_many :category, class_name: "Category",foreign_key: "sub_category_id"
  belongs_to :main_category, class_name: "Category"
  belongs_to :sub_category, class_name: "Category"
end
