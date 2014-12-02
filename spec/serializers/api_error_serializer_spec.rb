require 'spec_helper'

describe ApiErrorSerializer do

  context "when error code is 500" do
    let!(:api_error) { ApiError.new(500) }

    it "should respond \"Internal Server Error\"" do
      response = ApiErrorSerializer.new(api_error)
      expect(response.code).to eq(500)
      expect(response.message).to eq("Internal server error")
    end
  end

  context "when error code is 400" do
    let!(:api_error) { ApiError.new(400) }

    it "should respond \"Invalid object\"" do
      response = ApiErrorSerializer.new(api_error)
      expect(response.code).to eq(400)
      expect(response.message).to eq("Invalid object")
    end
  end

  context "when error code is 5001" do
    let!(:api_error) { ApiError.new(5001) }

    it "should respond \"No active user session\"" do
      response = ApiErrorSerializer.new(api_error)
      expect(response.code).to eq(5001)
      expect(response.message).to eq("No active user session")
    end
  end

  context "when error code is 5002" do
    let!(:api_error) { ApiError.new(5002) }

    it "should respond \"Username and password doesn\'t match\"" do
      response = ApiErrorSerializer.new(api_error)
      expect(response.code).to eq(5002)
      expect(response.message).to eq("Username and password doesn\'t match")
    end
  end

  context "when error code is 9001" do
    let!(:api_error) { ApiError.new(9001) }

    it "should respond \"Request unauthorized, Can\'t access this resource\"" do
      response = ApiErrorSerializer.new(api_error)
      expect(response.code).to eq(9001)
      expect(response.message).to eq("Request unauthorized, Can\'t access this resource")
    end
  end
end