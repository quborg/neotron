class ProductSerializer < ActiveModel::Serializer
 	attributes :id, :title, :sale_price, :published
 	has_one :user
end
