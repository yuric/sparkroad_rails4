require 'spec_helper'

describe SchoolGroup do

  describe '#groups' do

    it 'should not allow a group to be its own parent' do
      group = SchoolGroup.make!
      group.groups << group
      expect { group.save! }.to raise_error ActiveRecord::RecordInvalid
    end

    it 'should allow groups to be nested 3 levels' do

      parent_group = SchoolGroup.make!
      level_1_group = SchoolGroup.make!
      level_2_group = SchoolGroup.make!

      expect {
        parent_group.groups << level_1_group
        level_1_group.groups << level_2_group
      }.to_not raise_error
    end

    it 'should not allow groups to be nested more than 3 levels' do

      suppress_warnings do
        SchoolGroup::MAX_LEVEL = 3
      end


      parent_group = SchoolGroup.make!
      level_1_group = SchoolGroup.make!
      level_2_group = SchoolGroup.make!
      level_3_group = SchoolGroup.make!

      expect {
        parent_group.groups << level_1_group
        level_1_group.groups << level_2_group
        level_2_group.groups << level_3_group
        parent_group.save!
      }.to raise_error ActiveRecord::RecordInvalid
    end


    it 'should not allow circular references' do

      parent_group = SchoolGroup.make!
      level_1_group = SchoolGroup.make!
      level_2_group = SchoolGroup.make!

      expect {
        parent_group.groups << level_1_group
        level_1_group.groups << level_2_group
        level_2_group.groups << parent_group
        parent_group.save!
      }.to raise_error ActiveRecord::RecordInvalid
    end


  end
end
