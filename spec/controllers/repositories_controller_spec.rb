require 'spec_helper'

describe RepositoriesController do

  describe "GET 'index'" do
    it "returns http success" do
      user = FactoryGirl.create(:user)
      sign_in user
      get 'index'
      response.should be_success
    end
  end

end
