require 'spec_helper'

describe Broadcast do
  let(:medium_1) { BroadcastMedium.make! name: 'Medium 1' }
  let(:medium_2) { BroadcastMedium.make! name: 'Medium 2' }

  before :all do
    medium_1
    medium_2
  end

  describe '#title' do
    it 'should raise error when no title is given' do
      expect {
        Broadcast.make! title: nil
      }.to raise_error
    end
  end

  describe '#messages' do
    it 'should raise error if no message is given' do
      expect {
        Broadcast.make! messages: []
      }.to raise_error ActiveRecord::RecordInvalid
    end

    it 'should raise error if two messages of the same media type is given' do
      expect {
        Broadcast.make! messages: BroadcastMessage.make(2, media: medium_1)
      }.to raise_error ActiveRecord::RecordInvalid
    end

    it 'should raise error if AllMedia message is given with other messages' do
      expect {
        Broadcast.make! messages: [BroadcastMessage.make(all_media: true), BroadcastMessage.make]
      }.to raise_error ActiveRecord::RecordInvalid
    end

    it 'should raise error if no AllMedia message and missing media types' do
      expect {
        Broadcast.make! messages: [BroadcastMessage.make(media: medium_1, all_media: false)]
      }.to raise_error ActiveRecord::RecordInvalid
    end

    it 'should save broadcast with a single AllMedia Message' do
      expect {
        Broadcast.make! messages: [BroadcastMessage.make(all_media: true, media: nil)]
      }.to_not raise_error
    end

    it 'should save broadcast if all media type messages are specified' do
      expect {
        Broadcast.make! messages: [BroadcastMessage.make(media: medium_1), BroadcastMessage.make(media: medium_2)]
      }.to_not raise_error
    end
  end
end
