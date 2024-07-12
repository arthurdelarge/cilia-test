class Product < ApplicationRecord

  MIN_PRICE = 0
  MAX_PRICE = 1_000_000

  validates :description, presence: true,
                          length: {minimum: 4, maximum: 255},
                          format: {with: /[a-zA-Z]/}

  validates :price, presence: true,
                    numericality: { greater_than: MIN_PRICE, less_than: MAX_PRICE },
                    format: { with: /\A\d+(?:\.\d{0,2})?\z/ }

  has_many :sale_products
  has_many :sales, through: :sale_products

  has_attached_file :image, styles: { medium: "300x300", thumb: "100x100" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  
end
