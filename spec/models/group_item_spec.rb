require 'spec_helper'

describe GroupItem do

  subject(:group_item) { GroupItem.new }

  it 'should allow students to be associated' do
    expect {
      group_item.student = Student.make!
      group_item.save!
    }.to_not raise_error
  end

  it 'should allow groups to be associated' do
    expect {
      group_item.group = Group.make!
      group_item.save!
    }.to_not raise_error
  end

  it 'should not allow group and student at the same time' do
    expect {
      group_item.group = Group.make!
      group_item.student = Student.make!
      group_item.save!
    }.to raise_error ActiveRecord::RecordInvalid
  end
end
