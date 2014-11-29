require 'spec_helper'

describe Course do
  it { should have_many(:course_tests) }
  it { should have_many(:users) }
  it { should validate_presence_of(:name) }
end
