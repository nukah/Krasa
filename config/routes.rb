Krasaonline::Application.routes.draw do
  namespace :admin do 
  	resources :types do
  	  member do
  		  match '/add/:taxonomy_id' => 'types#add', :via => :get, :as => 'add_taxon'
  		  match '/remove/:taxonomy_id' => 'types#remove', :via => :get, :as => 'remove_taxon'
  	  end
  	  collection do
  		  post :available
  	  end
  	end
  end
  match '/type/:type' => 'types#show', :as => "set_type"
end
