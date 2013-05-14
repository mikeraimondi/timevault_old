require 'spec_helper'

describe "pomodoros/index" do
  before(:each) do
    assign(:pomodoros, [
      stub_model(Pomodoro,
        :paused => false
      ),
      stub_model(Pomodoro,
        :paused => false
      )
    ])
  end

  it "renders a list of pomodoros" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
