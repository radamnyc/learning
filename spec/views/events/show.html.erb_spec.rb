require 'spec_helper'

describe "events/show" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :description => "Description",
      :quisine => "Quisine",
      :suggested_donation => "9.99",
      :max_participants => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
    rendered.should match(/Quisine/)
    rendered.should match(/9.99/)
    rendered.should match(//)
  end
end
