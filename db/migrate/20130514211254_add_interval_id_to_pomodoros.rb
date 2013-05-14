class AddIntervalIdToPomodoros < ActiveRecord::Migration
  def change
    add_column :pomodoros, :interval_id, :integer
  end
end
