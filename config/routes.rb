Rails.application.routes.draw do

	root 'application#hello'

	constraints subdomain: 'api' do
		resources :products
		resources :users
	end

end
