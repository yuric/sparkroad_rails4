require 'spec_helper'

describe GroupItem do
  it 'should allow students to be associated' do
    group_item = GroupItem.new

    expect {
      group_item.student = Student.make!
      group_item.save!
    }.to_not raise_error
  end

  it 'should allow groups to be associated' do
    group_item = GroupItem.new

    expect {
      group_item.group = Group.make!
      group_item.save!
    }.to_not raise_error
  end

end
