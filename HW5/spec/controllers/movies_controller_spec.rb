require 'spec_helper'

describe MoviesController do

  describe "GET 'search_tmdb'" do
    it "returns http success" do
      get 'search_tmdb'
      response.should be_success
    end
  end

end
