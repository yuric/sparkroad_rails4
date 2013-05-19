require 'spec_helper'

describe "broadcast_messages/show" do
  before(:each) do
    @broadcast_message = assign(:broadcast_message, stub_model(BroadcastMessage,
      :broadcast => nil,
      :broadcast_media => nil,
      :all_media => false,
      :english_message => "MyText",
      :spanish_message => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/false/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
  end
end
