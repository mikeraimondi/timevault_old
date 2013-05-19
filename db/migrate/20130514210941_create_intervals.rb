class CreateIntervals < ActiveRecord::Migration
  def change
    create_table :intervals do |t|
      t.datetime :start, :null => false
      t.datetime :end
      t.integer  :pomodoro_id
      t.foreign_key :pomodoros

      t.timestamps
    end
  end
end
