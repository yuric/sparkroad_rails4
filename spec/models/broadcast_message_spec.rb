require 'spec_helper'

describe BroadcastMessage do

  let(:media_1) { BroadcastMedium.make! name: 'Media 1' }

  describe "messages" do
    it 'should raise error if both messages are empty' do
      expect {
        BroadcastMessage.make! english_message: '', spanish_message: ''
      }.to raise_error ActiveRecord::RecordInvalid
    end

    it 'should save english only messages' do
      expect {
        BroadcastMessage.make! english_message: 'MESSAGE', spanish_message: ''
      }.to_not raise_error
    end

    it 'should save spanish only messages' do
      expect {
        BroadcastMessage.make! english_message: '', spanish_message: 'MESSAGE'
      }.to_not raise_error
    end
  end

  describe "#media" do
    it 'should raise error if none of media or all_media is given' do
      expect {
        BroadcastMessage.make! all_media: false, media: nil
      }.to raise_error ActiveRecord::RecordInvalid
    end

    it 'should raise error if all_media and another media is given' do
      expect {
        BroadcastMessage.make! all_media: true, media: media_1
      }.to raise_error ActiveRecord::RecordInvalid
    end

    it 'should save if only all_media is given' do
      expect {
        BroadcastMessage.make! all_media: true, media: nil
      }.to_not raise_error
    end

    it 'should save if only media is given' do
      expect {
        BroadcastMessage.make! all_media: false, media: media_1
      }.to_not raise_error
    end
  end

end
