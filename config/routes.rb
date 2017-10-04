Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers, only: [:index, :show]
      resources :invoice_items, only: [:index, :show] do
        collection do
          get '/find_all', to: 'invoice_items/search#index'
          get '/find', to: 'invoice_items/search#show'
        end
      end
      resources :invoices, only: [:index, :show] do
        collection do
          get '/find_all', to: 'invoices/search#index'
          get '/find', to: 'invoices/search#show'
        end
      end
      resources :items, only: [:index, :show] do
        collection do
          get '/find_all', to: 'items/search#index'
          get '/find', to: 'items/search#show'
        end
      end
      resources :merchants, only: [:index, :show]
      resources :transactions, only: [:index, :show]
    end
  end
end
