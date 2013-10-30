require 'spec_helper'

describe UsersController do

  context "sign up" do
    let(:valid_params) do
      {email: "jtr@jtr.jtr", password: "1234pass"}
    end

    it "creates a user with valid params" do
      expect {
        post :create, :user => valid_params
      }.to change(User, :count).by(1)
    end

    it "should return an error if an invalid email was given" do
        post :create, user: { email: '1342.sdfs', password: "1234pass" }
        expect(response.status).to eq 401
    end

    xit "should create a session upon signing up" do

      post :create, user: valid_params

      session[:user_id].should eq User.last.id
    end

    # ^^^ might be more than one test


  end

end
