require 'spec_helper'

describe "pomodoros/new" do
  before(:each) do
    assign(:pomodoro, stub_model(Pomodoro,
      :paused => false
    ).as_new_record)
  end

  it "renders new pomodoro form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", pomodoros_path, "post" do
      assert_select "input#pomodoro_paused[name=?]", "pomodoro[paused]"
    end
  end
end
