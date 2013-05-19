require 'spec_helper'

describe "broadcast_media/edit" do
  before(:each) do
    @broadcast_medium = assign(:broadcast_medium, stub_model(BroadcastMedium,
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit broadcast_medium form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", broadcast_medium_path(@broadcast_medium), "post" do
      assert_select "input#broadcast_medium_name[name=?]", "broadcast_medium[name]"
      assert_select "input#broadcast_medium_description[name=?]", "broadcast_medium[description]"
    end
  end
end
