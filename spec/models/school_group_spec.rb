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

  describe "Time Traveling" do
    it 'should be able fetch a deleted group' do
      group = SchoolGroup.make! name: 'Testing Group'
      group_id = group.id
      group.destroy!

      expect(SchoolGroup.undelete(group_id).name).to eq('Testing Group')
    end
    it 'should be able to restore a removed person from a group' do
      start_time = Time.now
      person_1 = Person.make!
      person_2 = Person.make!

      group = SchoolGroup.make
      Timecop.freeze(start_time) do
        group.save!
      end

      Timecop.freeze(start_time + 10) do
        group.people << person_1
        group.people << person_2
        group.save!
      end
      Timecop.freeze(start_time + 20) do
        group.items.clear
        group.save!

      end

      past_group = group.at_time(start_time + 10)

      expect(past_group.items.all).to include(person_1)
      expect(past_group.items.all).to include(person_2)

    end
    it 'should be able to restore a removed group from a group' do
      pending
    end
    it 'should be able to restore a changed name from a group' do

      start_time = Time.now
      group = SchoolGroup.make name: 'Travel Group'
      Timecop.freeze(start_time) do
        group.save!
      end
      Timecop.freeze start_time+10 do
        group.name = "Another name"
        group.save!
      end

      expect(group.at_time(start_time).name).to eq('Travel Group')
    end
  end
end
