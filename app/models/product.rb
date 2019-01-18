class Product < ApplicationRecord
  has_many :images
  belongs_to :category
  has_many :supplier_products
  has_many :suppliers, through: :supplier_products
  accepts_nested_attributes_for :images

  scope :order_by, -> {order created_at: :desc}
  scope :select_products, -> {select :id, :name, :manufacture, :net_weight, :price, :category_id, :description}
  
  scope :search_products_by_category, -> category_name {Product.includes(:category)
    .where(categories: {name: category_name}) unless category_name.nil?}
  
  def self.search_by_name search
    if search
      where("name LIKE ?", "%#{search}%")
    else
      all
    end
  end
end
