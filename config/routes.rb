Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers, only: [:index, :show] do
        collection do
          get '/find_all', to: 'customers/search#index'
          get '/find', to: 'customers/search#show'
        end
        end
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
      resources :merchants, only: [:index, :show] do
        collection do
          get '/find_all', to: 'merchants/search#index'
          get '/find', to: 'merchants/search#show'
        end
      end
      resources :transactions, only: [:index, :show] do
      collection do
        get '/find_all', to: 'transactions#index'
        get '/find', to: 'transactions#show'
      end
    end
    end
  end
end
