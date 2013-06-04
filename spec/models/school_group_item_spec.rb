require 'spec_helper'

describe SchoolGroupItem do

  subject { SchoolGroupItem.make }

  it_behaves_like "a groupable item"
end
