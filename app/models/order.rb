class Order < ApplicationRecord
  belongs_to :user
  has_many :placements
  has_many :products, through: :placements

  validates :total, numericality: { greater_than_or_equal_to: 0 }
  # validates :total, presence: true,
  #                   numericality: { greater_than_or_equal_to: 0 }
  validates_with EnoughProductsValidator #add custom validator
  validates :user_id, presence: true

  before_validation :set_total!

  def set_total!
    self.total = 0
    placements.each do |placement|
      self.total += placement.product.price * placement.quantity
    end
  end

  def build_placements_with_product_ids_and_quantities(product_ids_and_quantities)
    product_ids_and_quantities.each do |product_id_and_quantity|
      id, quantity = product_id_and_quantity # [1,5]

      self.placements.build(product_id: id)
    end
  end
end
