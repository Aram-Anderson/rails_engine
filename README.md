# Rails Engine Documentation

### Project by Mike Butera([github](https://github.com/Boots2291)) and Aram Anderson([github](https://github.com/Aram-Anderson))

This app is a restful API built in Rails using PostgreSQL as a database.

To clone down the repo locally, use `git clone https://github.com/Aram-Anderson/rails_engine.git`

To clone down the associated spec harness, use `git clone https://github.com/turingschool/rales_engine_spec_harness.git`

To set the project up locally, after cloning down the repo `cd rails_engine`, `bundle`, `rake db:{create,migrate}`, seed the database with `rake csv_seed_data:seed_all`.

Use `rails s` to start a local server. Navigate to localhost:3000 to get to the project.

To run our test suite, use `rspec`.

To run the spec harness, spin up a local server with `rails s` in the root directory of the project. Then in a different terminal tab or window, navigate to the root directory of the spec harness with `cd rales_engine_spec_harness`. Run the spec harness with `rake`.


Tech used

* Ruby version 2.4.1
* Rails version 5.1.4
* PostgreSQL

There are quite a few API endpoints available. To access any of them, prepend one of the endpoints below with  http://localhost:3000 if you're running it on a local server via rails s.

* GET '/api/v1/customers/random'

* GET '/api/v1/customers/:id/favorite_merchant'

* GET '/api/v1/customers/:id/invoices'

* GET '/api/v1/customers/:id/transactions'

* GET '/api/v1/customers/:id'

* GET '/api/v1/customers/'

* GET '/api/v1/customers/find?parameter=x'

* GET '/api/v1/customers/find_all?parameter=x'

Valid customer parameters are id, first_name, last_name, created_at, and updated_at.

* GET '/api/v1/invoices/random'

* GET '/api/v1/invoices/:id/customer'

* GET '/api/v1/invoices/:id/invoice_items'

* GET '/api/v1/invoices/:id/items'

* GET '/api/v1/invoices/:id/merchant'

* GET '/api/v1/invoices/:id/transactions'

* GET '/api/v1/invoices/:id'

* GET '/api/v1/invoices/'

* GET '/api/v1/invoices/find?parameter=x'

* GET '/api/v1/invoices/find_all?parameter=x'

Valid invoice parameters are id, status, customer_id, merchant_id, created_at, and updated_at.

* GET '/api/v1/items/most_items?quantity=x'

* GET '/api/v1/items/most_revenue?quantity=x'

* GET '/api/v1/items/random'

* GET '/api/v1/items/:id/best_day'

* GET '/api/v1/items/:id/invoice_items'

* GET '/api/v1/items/:id/merchant'

* GET '/api/v1/items/:id'

* GET '/api/v1/items/'

* GET '/api/v1/items/find?parameter=x'

* GET '/api/v1/items/find_all?parameter=x'

Valid item parameters are id, name, description, unit_price, created_at, updated_at, and merchant_id.

* GET '/api/v1/invoice_items/random'

* GET '/api/v1/invoice_items/:id/invoice'

* GET '/api/v1/invoice_items/:id/item'

* GET '/api/v1/invoice_items/:id'

* GET '/api/v1/invoice_items/'

* GET '/api/v1/invoice_items/find?parameter=x'

* GET '/api/v1/invoice_items/find_all?parameter=x'

Valid invoice_item parameters are id, item_id, invoice_id, quantity, unit_price, created_at, and updated_at.

* GET '/api/v1/merchants/most_items?quantity=x'

* GET '/api/v1/merchants/most_revenue?quantity=x'

* GET '/api/v1/merchants/random'

* GET '/api/v1/merchants/revenue?date=x'

* GET '/api/v1/merchants/:id/customers_with_pending_invoices'

* GET '/api/v1/merchants/:id/favorite_customer'

* GET '/api/v1/merchants/:id/invoices'

* GET '/api/v1/merchants/:id/items'

* GET '/api/v1/merchants/:id/revenue?date=x'

* GET '/api/v1/merchants/:id'

* GET '/api/v1/merchants/'

* GET '/api/v1/merchants/find?parameter=x'

* GET '/api/v1/merchants/find_all?parameter=x'

Merchant parameters are id, name, created_at, and updated_at.

* GET '/api/v1/transactions/random'

* GET '/api/v1/transactions/:id/invoice'

* GET '/api/v1/transactions/:id'

* GET '/api/v1/transactions/'

* GET '/api/v1/transactions/find?parameter=x'

* GET '/api/v1/transactions/find_all?parameter=x'

Valid transaction parameters are id, invoice_id, credit_card_number, credit_card_expiration_date, result, created_at, and updated_at.
