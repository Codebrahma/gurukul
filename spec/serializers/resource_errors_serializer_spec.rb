require 'spec_helper'

describe ResourceErrorsSerializer do
  context "when object is valid" do
    let(:user) { FactoryGirl.create(:user) }

    it "should respond no message" do
      response = ResourceErrorsSerializer.new(user)
      expect(response.code).to eq(200)
      expect(response.message).to match_array([])
    end
  end

  context "when object is invalid" do
    let(:user) { User.create }

    it "should respond the error messages" do
      response = ResourceErrorsSerializer.new(user)
      expect(response.code).to eq(400)
      expect(response.message).to match_array([
        "Email can't be blank", 
        "Password can't be blank", 
        "Name can't be blank"
      ])
    end
  end
end