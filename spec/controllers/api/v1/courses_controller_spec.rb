require 'spec_helper'

describe Api::V1::CoursesController do

  describe "when user is logged in" do
    
    before do
      sign_in current_user
    end

    let!(:current_user) { FactoryGirl.create(:user) }
    let!(:sample_courses) { FactoryGirl.create_list(:course, 20, company: sample_company) }
    let(:json) { ActiveSupport::JSON.decode(response.body) }

    context "GET index" do
      it "should fetch courses" do
        get :index, format: :json
        expect(json.count).to eq(10)
      end
    end

    

  end

  describe "when user is NOT logged in" do
  end

end
