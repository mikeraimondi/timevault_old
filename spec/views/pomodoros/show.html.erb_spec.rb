require 'spec_helper'

describe "pomodoros/show" do
  before(:each) do
    @pomodoro = assign(:pomodoro, stub_model(Pomodoro,
      :paused => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
