require 'spec_helper'

describe "broadcast_messages/edit" do
  before(:each) do
    @broadcast_message = assign(:broadcast_message, stub_model(BroadcastMessage,
      :broadcast => nil,
      :broadcast_media => nil,
      :all_media => false,
      :english_message => "MyText",
      :spanish_message => "MyText"
    ))
  end

  it "renders the edit broadcast_message form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", broadcast_message_path(@broadcast_message), "post" do
      assert_select "input#broadcast_message_broadcast[name=?]", "broadcast_message[broadcast]"
      assert_select "input#broadcast_message_broadcast_media[name=?]", "broadcast_message[broadcast_media]"
      assert_select "input#broadcast_message_all_media[name=?]", "broadcast_message[all_media]"
      assert_select "textarea#broadcast_message_english_message[name=?]", "broadcast_message[english_message]"
      assert_select "textarea#broadcast_message_spanish_message[name=?]", "broadcast_message[spanish_message]"
    end
  end
end
