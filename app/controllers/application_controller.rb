class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :null_session
	# filter_parameter_logging :password
	include Authenticable

	def hello
		render text: "Hello World !\n"
	end
end
