class CreatePomodoros < ActiveRecord::Migration
  def change
    create_table :pomodoros do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :paused
      t.integer :user_id

      t.timestamps
    end
  end
end
