require 'spec_helper'

describe TasksController do
  let(:user) { FactoryGirl.create(:user) }
  let(:task) { FactoryGirl.create(:task, user: user) }

  context "when signed in" do
    before(:each) {sign_in user}

    describe "GET 'index'" do
      it "returns http success" do
        get :index
        expect(response).to be_success
      end
    end

    describe "GET 'edit'" do
      it "returns http success" do
        get :edit, {:id => task.id}
        expect(response).to be_success
      end
    end

    describe "GET 'show'" do
      it "returns http success" do
        get :show, {:id => task.id}
        expect(response).to be_success
      end
    end

    describe "GET 'new'" do
      it "returns http success" do
        get :new, {}
        expect(response).to be_success
      end
    end

  end

end
