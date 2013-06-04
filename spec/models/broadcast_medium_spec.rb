require 'spec_helper'

describe BroadcastMedium do

  describe "name" do
    it 'should raise error if no name is given' do
      expect {
        BroadcastMedium.make! name: ''
      }.to raise_error ActiveRecord::RecordInvalid
    end

    it 'should save if name is given' do
      expect {
        BroadcastMedium.make! name: 'Media 1'
      }.to_not raise_error
    end
  end

  describe "description" do
    it 'should raise error if no description is given' do
      expect {
        BroadcastMedium.make! description: ''
      }.to raise_error ActiveRecord::RecordInvalid
    end

    it 'should save if description is given' do
      expect {
        BroadcastMedium.make! description: 'Media Description 1'
      }.to_not raise_error
    end
  end
end
