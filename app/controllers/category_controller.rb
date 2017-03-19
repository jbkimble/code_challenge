class CategoryController < ApplicationController
  def index
    @categories = StreetCafe.unique_column_values('category')
  end
end
