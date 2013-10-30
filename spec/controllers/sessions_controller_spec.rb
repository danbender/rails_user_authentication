require 'spec_helper'

describe SessionsController do

  context "log in" do

    it "should respond with 401 status code when no email / password was sent" do
      post :create
      expect(response.status).to eq 401
    end

    it "should response with 200 status code if correct email / password are entered" do
      user = User.create(email: "me@example.com", password: "1234pass")
      post :create, {email: user.email, password: "1234pass"}
      expect(session[:user_id]).to eq user.id
    end

  end

  context "log out" do
    it "should destroy the user session when user logs out" do
      user = User.create(email: "dan@dan.dan", password: "123dan")
      p session
      delete :destroy, {id: user.id }
      expect(session[:id]).to be_nil
    end

  end

end
