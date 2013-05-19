require 'spec_helper'

describe "broadcast_media/show" do
  before(:each) do
    @broadcast_medium = assign(:broadcast_medium, stub_model(BroadcastMedium,
      :name => "Name",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Description/)
  end
end
