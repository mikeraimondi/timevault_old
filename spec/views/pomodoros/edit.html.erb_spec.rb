require 'spec_helper'

describe "pomodoros/edit" do
  before(:each) do
    @pomodoro = assign(:pomodoro, stub_model(Pomodoro,
      :paused => false
    ))
  end

  it "renders the edit pomodoro form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", pomodoro_path(@pomodoro), "post" do
      assert_select "input#pomodoro_paused[name=?]", "pomodoro[paused]"
    end
  end
end
