require 'spec_helper'

describe CourseTest do
  it { should belong_to(:course) }
  it { should have_many(:test_reports) }
end
