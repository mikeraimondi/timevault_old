class AddPeriodToPomodoros < ActiveRecord::Migration
  def up
    add_column :pomodoros, :period, :string
    Pomodoro.update_all(period: "productive")
    change_column :pomodoros, :period, :string, null: false
  end

  def down
    remove_column :pomodoros, :period
  end
end
