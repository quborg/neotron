class CreateProducts < ActiveRecord::Migration

	def change
		create_table :products do |t|
			t.string	:sku
			t.string	:title,				default: ""
			t.decimal	:sale_price,		default: 0.0
			t.decimal	:purchase_price,	default: 0.0
			t.integer	:quantity
			t.string	:image
			t.boolean	:published,		default: false
			t.integer	:user_id

			t.timestamps null: false
		end
		add_index :products, :user_id
		add_index :products, :sku, unique: true
	end

end
