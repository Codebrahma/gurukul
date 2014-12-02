require "spec_helper"

describe ApiError do
  context "possible errors" do
    context "for error code 400" do
      it "should return the appropriate error message" do
        expect(ApiError.new(400).send(:error_hash)).to eq({
          :code => 400,
          :message => "Invalid object"
        })
      end
    end

    context "for error code 500" do
      it "should return the appropriate error message" do
        expect(ApiError.new(500).send(:error_hash)).to eq({
          :code => 500,
          :message => "Internal server error"
        })
      end
    end

    context "for error code 5001" do
      it "should return the appropriate error message" do
        expect(ApiError.new(5001).send(:error_hash)).to eq({
          :code => 5001,
          :message => "No active user session"
        })
      end
    end

    context "for error code 5002" do
      it "should return the appropriate error message" do
        expect(ApiError.new(5002).send(:error_hash)).to eq({
          :code => 5002,
          :message => "Username and password don't match"
        })
      end
    end

    context "for error code 9001" do
      it "should return the appropriate error message" do
        expect(ApiError.new(9001).send(:error_hash)).to eq({
          :code => 9001,
          :message => "Request unauthorized, Can't access this resource"
        })
      end
    end
  end
end
