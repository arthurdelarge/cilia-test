class Sale < ApplicationRecord
  validates_presence_of :client
  validate :product_ids_present
  belongs_to :client
  has_many :sale_products, dependent: :destroy
  has_many :products, through: :sale_products
  accepts_nested_attributes_for :sale_products, allow_destroy: true
  
  def product_ids_present
    if product_ids.empty?
      errors.add(:product_ids, :empty)
    end
  end
end
