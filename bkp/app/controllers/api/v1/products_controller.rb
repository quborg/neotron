class Api::V1::ProductsController < ApplicationController

	# before_action :set_auth_token

	def index
		products = Product.all
		render json: products, status: 200
	end

	def show
		product = Product.find(params[:id])
		render json: product, status: 200
	end

	def create
		product = Product.new(product_params)
		if product.save
			render json: product, status: 201, location: product	# render nothing: true, status: 204, location: product 	# head 204, location: product
		else
			render json: product.errors, status: 422
		end
	end

	def update
		product = Product.find(params[:id])
		if product.update(product_params)
			render json: product, status: 200
		else
			render json: product.errors, status: 422
		end
	end

	# def destroy
	# 	product = Product.find(params[:id])
	# 	product.destroy
	# 	head 204
	# end

	private

		def product_params
			params.require(:product).permit(:name)
		end

		# def set_auth_token
		# 	return if auth_token.present?
		# 	self.auth_token = generate_auth_token
		# end

		# def generate_auth_token
		# 	loop do
		# 		token = SecureRandom.hex
		# 		break token unless self.class.exists?(auth_token: token)
		# 	end
		# end
	# end

	# protected

	# 	def authenticate
	# 		authenticate_token || render_unauthorized
	# 	end

	# 	def authenticate_token
	# 		authenticate_with_http_token do |token, options|
	# 			User.find_by(auth_token: token)
	# 	end

	# 	def render_unauthorized
	# 		self.headers['WWW-Authenticate'] = 'Basic realm="Products"'
	# 		render json: 'Bad credentials', status: 401
	# 	end
	# end

end
