Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers, only: [:index, :show] do
        collection do
          get '/find_all', to: 'customers/search#index'
          get '/find', to: 'customers/search#show'
          get '/random', to: 'customers/random#show'
          get '/:id/invoices', to: 'customers/invoices#index'
          get '/:id/transactions', to: 'customers/transactions#index'
          get '/:id/favorite_merchant', to: 'customers/favorite_merchant#show'
        end
      end
      resources :invoice_items, only: [:index, :show] do
        collection do
          get '/find_all', to: 'invoice_items/search#index'
          get '/find', to: 'invoice_items/search#show'
          get '/random', to: 'invoice_items/random#show'
          get '/:id/invoice', to: 'invoice_items/invoices#show'
          get '/:id/item', to: 'invoice_items/items#show'
        end
      end
      resources :invoices, only: [:index, :show] do
        collection do
          get '/find_all', to: 'invoices/search#index'
          get '/find', to: 'invoices/search#show'
          get '/random', to: 'invoices/random#show'
          get '/:id/transactions', to: 'invoices/transactions#index'
          get '/:id/invoice_items', to: 'invoices/invoice_items#index'
          get '/:id/items', to: 'invoices/items#index'
          get '/:id/customer', to: 'invoices/customers#show'
          get '/:id/merchant', to: 'invoices/merchants#show'
        end
      end
      resources :items, only: [:index, :show] do
        collection do
          get '/find_all', to: 'items/search#index'
          get '/find', to: 'items/search#show'
          get '/random', to: 'items/random#show'
          get '/:id/invoice_items', to: 'items/invoice_items#index'
          get '/:id/merchant', to: 'items/merchants#show'
          get '/most_revenue', to: 'items/revenue#index'
          get '/most_items', to: 'items/quantity#index'
          get '/:id/best_day', to: 'items/best_day#show'
        end
      end
      resources :merchants, only: [:index, :show] do
        collection do
          get '/find_all', to: 'merchants/search#index'
          get '/find', to: 'merchants/search#show'
          get '/random', to: 'merchants/random#show'
          get '/most_revenue', to: 'merchants/most_revenue#index'
          get '/:id/most_revenue', to: 'merchants/most_revenue#show'
          get '/most_items', to: 'merchants/most_items#index'
          get '/revenue', to: 'merchants/date#index'
          get '/:id/items', to: 'merchants/items#index'
          get '/:id/invoices', to: 'merchants/invoices#index'
          get '/:id/favorite_customer', to: 'merchants/customer#show'
          get '/:id/revenue', to: 'merchants/revenue#show'
          get '/:id/customers_with_pending_invoices', to: 'merchants/unpaid#show'
        end
      end
      resources :transactions, only: [:index, :show] do
        collection do
          get '/find_all', to: 'transactions/search#index'
          get '/find', to: 'transactions/search#show'
          get '/random', to: 'transactions/random#show'
          get '/:id/invoice', to: 'transactions/invoices#show'
        end
      end
    end
  end
end
