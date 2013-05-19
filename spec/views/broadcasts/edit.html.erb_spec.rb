require 'spec_helper'

describe "broadcasts/edit" do
  before(:each) do
    @broadcast = assign(:broadcast, stub_model(Broadcast,
      :title => "MyString",
      :school => nil
    ))
  end

  it "renders the edit broadcast form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", broadcast_path(@broadcast), "post" do
      assert_select "input#broadcast_title[name=?]", "broadcast[title]"
      assert_select "input#broadcast_school[name=?]", "broadcast[school]"
    end
  end
end
