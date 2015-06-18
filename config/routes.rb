Rails.application.routes.draw do

  devise_for :users
	root 'application#hello'

	constraints subdomain: 'api' do
		namespace :api, path: '/', defaults: { format: :json } do
			scope module: :v1, path: '/v1' do
				resources :products
				# resources :users
			end
		end
	end

end
