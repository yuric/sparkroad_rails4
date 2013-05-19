require 'spec_helper'

describe "broadcasts/index" do
  before(:each) do
    assign(:broadcasts, [
      stub_model(Broadcast,
        :title => "Title",
        :school => nil
      ),
      stub_model(Broadcast,
        :title => "Title",
        :school => nil
      )
    ])
  end

  it "renders a list of broadcasts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
