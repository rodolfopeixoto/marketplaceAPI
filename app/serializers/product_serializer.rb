class ProductSerializer < ActiveModel::Serializer
  cache key: 'product', expires_in: 7.hours

  attributes :id, :title, :price, :published
  has_one :user

  def cache_key
    [object, scope]
  end
end
