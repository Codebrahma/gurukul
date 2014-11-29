require 'spec_helper'

describe User do
  it { should have_many(:courses) }
  it { should have_many(:course_tests) }
  it { should have_many(:test_reports) }
  it { should validate_presence_of(:name) }
end
