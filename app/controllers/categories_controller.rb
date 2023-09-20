class CategoriesController < ApplicationController
  def index
    puts '****************************************************************'
    puts 'the current user is', current_user
  end
end
