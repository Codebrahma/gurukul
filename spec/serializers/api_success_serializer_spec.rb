require 'spec_helper'

describe ApiSuccessSerializer do
  let(:user) { FactoryGirl.create(:user) }

  context "when a response is success" do
    it "should serialize the object correctly" do
      response = ApiSuccessSerializer.new(user)
      expect(response.code).to eq(200)
      expect(response.message).to eq(user)
    end
  end
end