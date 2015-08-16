require 'spec_helper'

describe Product do
	let(:product) { FactoryGirl.build :product }
	subject { product }

	it { should respond_to(:sku) }
	it { should respond_to(:title) }
	it { should respond_to(:sale_price) }
	it { should respond_to(:purchase_price) }
	it { should respond_to(:quantity) }
	it { should respond_to(:image) }
	it { should respond_to(:published) }
	it { should respond_to(:user_id) }
	it { should respond_to(:user) }

	it { should_not be_published }

	it { should validate_presence_of :title }
	it { should validate_presence_of :sale_price }
	it { should validate_numericality_of(:sale_price).is_greater_than_or_equal_to(0) }
	it { should validate_presence_of :user_id }

	it { should belong_to :user }

	describe ".filter_by_title" do
		before(:each) do
			@product1 = FactoryGirl.create :product, title: "A plasma TV"
			@product2 = FactoryGirl.create :product, title: "Fastest Laptop"
			@product3 = FactoryGirl.create :product, title: "CD player"
			@product4 = FactoryGirl.create :product, title: "LCD TV"
		end
		# p Product.filter_by_title("TV")
		context "when a 'TV' title pattern is sent" do
			it "returns the 2 products matching" do
				expect(Product.filter_by_title("TV")).to have_at_least(2).items
			end
			it "returns the products matching" do
				expect(Product.filter_by_title("TV").sort).to match_array([@product1, @product4])
			end
		end
	end
	describe ".above_or_equal_to_price" do
		before(:each) do
			@product1 = FactoryGirl.create :product, sale_price: 100
			@product2 = FactoryGirl.create :product, sale_price: 50
			@product3 = FactoryGirl.create :product, sale_price: 150
			@product4 = FactoryGirl.create :product, sale_price: 99
		end

		it "returns the products which are above or equal to the sale_price" do
			expect(Product.above_or_equal_to_price(100).sort).to match_array([@product1, @product3])
		end
	end
	describe ".below_or_equal_to_price" do
		before(:each) do
			@product1 = FactoryGirl.create :product, sale_price: 100
			@product2 = FactoryGirl.create :product, sale_price: 50
			@product3 = FactoryGirl.create :product, sale_price: 150
			@product4 = FactoryGirl.create :product, sale_price: 99
		end

		it "returns the products which are above or equal to the sale_price" do
			expect(Product.below_or_equal_to_price(99).sort).to match_array([@product2, @product4])
		end
	end
	describe ".recent" do
		before(:each) do
			@product1 = FactoryGirl.create :product, sale_price: 100
			@product2 = FactoryGirl.create :product, sale_price: 50
			@product3 = FactoryGirl.create :product, sale_price: 150
			@product4 = FactoryGirl.create :product, sale_price: 99
			@product2.touch #we will touch some products to update them
			@product3.touch
		end
		it "returns the most updated records" do
			expect(Product.recent).to match_array([@product3, @product2, @product4, @product1])
		end
	end
	describe ".search" do
		before(:each) do
			@product1 = FactoryGirl.create :product, sale_price: 100, title: "Plasma tv"
			@product2 = FactoryGirl.create :product, sale_price: 50, title: "Videogame console"
			@product3 = FactoryGirl.create :product, sale_price: 150, title: "MP3"
			@product4 = FactoryGirl.create :product, sale_price: 99, title: "Laptop"
		end
		context "when title 'videogame' and '100' a min sale_price are set" do
			it "returns an empty array" do
				search_hash = { keyword: "videogame", min_price: 100 }
				expect(Product.search(search_hash)).to be_empty
			end
		end
		context "when title 'tv', '150' as max sale_price, and '50' as min sale_price are set" do
			it "returns the product1" do
				search_hash = { keyword: "tv", min_price: 50, max_price: 150 }
				expect(Product.search(search_hash)).to match_array([@product1])
			end
		end
		context "when an empty hash is sent" do
			it "returns all the products" do
				expect(Product.search({})).to match_array([@product1, @product2, @product3, @product4])
			end
		end
		context "when product_ids is present" do
			it "returns the product from the ids" do
				search_hash = { product_ids: [@product1.id, @product2.id]}
				expect(Product.search(search_hash)).to match_array([@product1, @product2])
			end
		end
	end
end
