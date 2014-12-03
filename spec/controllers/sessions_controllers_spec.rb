require 'spec_helper'

describe SessionsController do

  describe "#create" do
    before(:each){
      @request.env["devise.mapping"] = Devise.mappings[:user]
    }

    context "when user enters valid credentials" do
      let!(:user) { FactoryGirl.create(:user) }

      it "should respond 200 status and current_user as message" do
        post :create, { :user => { :email => user.email, :password => "password123" } }
        expect(json["code"]).to eq(200)
        expect(json["message"]["id"]).to eq(user.id)
      end
    end

    context "when user enters invalid credentials" do
      let!(:user) { FactoryGirl.create(:user) }

      it "should respond 5002 status and invalid credentials as message" do
        post :create, { :user => { :email => "invalid@email.com", :password => "password123" } }
        expect(json["code"]).to eq(5002)
        expect(json["message"]).to eq("Username and password doesn't match")
      end
    end
  end

  describe "#destroy" do
    before(:each){
      @request.env["devise.mapping"] = Devise.mappings[:user]
    }

    context "when user is signed in" do 
      let!(:user) { FactoryGirl.create(:user) }

      it "should respond 200 status and true" do
        sign_in(user)
        delete :destroy
        expect(json["code"]).to eq(200)
        expect(json["message"]).to eq(true)
      end
    end

    context "when user is not signed in" do 
      let!(:user) { FactoryGirl.create(:user) }

      it "should respond 200 status and true" do
        delete :destroy
        expect(json["code"]).to eq(5001)
        expect(json["message"]).to eq("No active user session")
      end
    end
  end
end