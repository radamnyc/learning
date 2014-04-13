require 'spec_helper'

describe "events/index" do
  before(:each) do
    assign(:events, [
      stub_model(Event,
        :description => "Description",
        :quisine => "Quisine",
        :suggested_donation => "9.99",
        :max_participants => ""
      ),
      stub_model(Event,
        :description => "Description",
        :quisine => "Quisine",
        :suggested_donation => "9.99",
        :max_participants => ""
      )
    ])
  end

  it "renders a list of events" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Quisine".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
