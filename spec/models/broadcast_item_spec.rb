require 'spec_helper'

describe BroadcastItem do

  subject { SchoolGroupItem.make }

  it_behaves_like "a groupable item"
end
