class CafesController < ApplicationController
  def  index
    @postcodes = StreetCafe.unique_postcodes
  end
end
