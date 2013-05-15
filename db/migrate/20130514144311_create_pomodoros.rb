class CreatePomodoros < ActiveRecord::Migration
  def change
    create_table :pomodoros do |t|
      t.integer :duration
      t.integer :user_id

      t.timestamps
    end
  end
end
