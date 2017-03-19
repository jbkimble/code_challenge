class CafesController < ApplicationController
  def  index
    @postcodes = StreetCafe.unique_column_values('postcode')
  end
end
