class ApplicationController < ActionController::API
  def find_random
    "SELECT * FROM items ORDER BY random() LIMIT 1;"
  end
end
