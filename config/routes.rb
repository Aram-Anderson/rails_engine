Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers, only: [:index, :show] do
        collection do
          get '/find_all', to: 'customers/search#index'
          get '/find', to: 'customers/search#show'
          get '/random', to: 'customers/random#show'
        end
      end
      resources :invoice_items, only: [:index, :show] do
        collection do
          get '/find_all', to: 'invoice_items/search#index'
          get '/find', to: 'invoice_items/search#show'
          get '/random', to: 'invoice_items/random#show'
        end
      end
      resources :invoices, only: [:index, :show] do
        collection do
          get '/find_all', to: 'invoices/search#index'
          get '/find', to: 'invoices/search#show'
          get '/random', to: 'invoices/random#show'
        end
      end
      resources :items, only: [:index, :show] do
        collection do
          get '/find_all', to: 'items/search#index'
          get '/find', to: 'items/search#show'
          get '/random', to: 'items/random#show'
        end
      end
      resources :merchants, only: [:index, :show] do
        collection do
          get '/find_all', to: 'merchants/search#index'
          get '/find', to: 'merchants/search#show'
          get '/random', to: 'merchants/random#show'
        end
      end
      resources :transactions, only: [:index, :show] do
      collection do
        get '/find_all', to: 'transactions/search#index'
        get '/find', to: 'transactions/search#show'
        get '/random', to: 'transactions/random#show'
      end
    end
    end
  end
end
