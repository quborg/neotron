require 'api_constraints'

ZaminTronApi::Application.routes.draw do

	mount SabisuRails::Engine => "/sabisu_rails"
	root 'application#hello'

	devise_for :users

	constraints subdomain: 'api' do
		namespace :api, path: '/', defaults: { format: :json } do
			scope module: :v1, path: '/v1', constraints: ApiConstraints.new(version: 1, default: true) do
				resources :products, :only => [:show, :index]
				resources :users, :only => [:show, :create, :update, :destroy] do
					resources :products, :only => [:create, :update, :destroy]
				end
				resources :sessions, :only => [:create, :destroy]
			end
		end
	end

end
