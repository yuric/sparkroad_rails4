require 'spec_helper'

describe "broadcasts/new" do
  before(:each) do
    assign(:broadcast, stub_model(Broadcast,
      :title => "MyString",
      :school => nil
    ).as_new_record)
  end

  it "renders new broadcast form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", broadcasts_path, "post" do
      assert_select "input#broadcast_title[name=?]", "broadcast[title]"
      assert_select "input#broadcast_school[name=?]", "broadcast[school]"
    end
  end
end
