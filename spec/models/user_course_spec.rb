require 'spec_helper'

describe UserCourse do

  it { should belong_to(:user) }
  it { should belong_to(:course) }
  
end
