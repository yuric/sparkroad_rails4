require 'spec_helper'

describe "broadcast_media/new" do
  before(:each) do
    assign(:broadcast_medium, stub_model(BroadcastMedium,
      :name => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new broadcast_medium form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", broadcast_media_path, "post" do
      assert_select "input#broadcast_medium_name[name=?]", "broadcast_medium[name]"
      assert_select "input#broadcast_medium_description[name=?]", "broadcast_medium[description]"
    end
  end
end
