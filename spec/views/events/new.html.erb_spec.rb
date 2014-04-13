require 'spec_helper'

describe "events/new" do
  before(:each) do
    assign(:event, stub_model(Event,
      :description => "MyString",
      :quisine => "MyString",
      :suggested_donation => "9.99",
      :max_participants => ""
    ).as_new_record)
  end

  it "renders new event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => events_path, :method => "post" do
      assert_select "input#event_description", :name => "event[description]"
      assert_select "input#event_quisine", :name => "event[quisine]"
      assert_select "input#event_suggested_donation", :name => "event[suggested_donation]"
      assert_select "input#event_max_participants", :name => "event[max_participants]"
    end
  end
end
