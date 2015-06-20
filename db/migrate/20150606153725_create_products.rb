class CreateProducts < ActiveRecord::Migration

	def change
		create_table :products do |t|
			t.string :sku
			t.string :name
			t.decimal :sale_price
			t.decimal :purchase_price
			t.integer :quantity
			t.string :image

			t.timestamps null: false
		end
		add_index :products, :sku, unique: true
	end

end
