require 'spec_helper'

describe GroupItem do

  subject { GroupItem.new }

  it_behaves_like "a groupable item"
end
