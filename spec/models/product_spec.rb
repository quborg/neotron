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

	it { should_not be_published }

	it { should validate_presence_of :title }
	it { should validate_presence_of :sale_price }
	it { should validate_numericality_of(:sale_price).is_greater_than_or_equal_to(0) }
	it { should validate_presence_of :user_id }

	it { should belong_to :user }
end
