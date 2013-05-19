require 'spec_helper'

describe "broadcast_messages/index" do
  before(:each) do
    assign(:broadcast_messages, [
      stub_model(BroadcastMessage,
        :broadcast => nil,
        :broadcast_media => nil,
        :all_media => false,
        :english_message => "MyText",
        :spanish_message => "MyText"
      ),
      stub_model(BroadcastMessage,
        :broadcast => nil,
        :broadcast_media => nil,
        :all_media => false,
        :english_message => "MyText",
        :spanish_message => "MyText"
      )
    ])
  end

  it "renders a list of broadcast_messages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
