class AddPeriodToPomodoros < ActiveRecord::Migration
  def up
    add_column :pomodoros, :period, :string, null: false
    Pomodoro.destroy_all
  end

  def down
    remove_column :pomodoros, :period
  end
end
