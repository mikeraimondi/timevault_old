class RemoveWorkerIdFromIntervals < ActiveRecord::Migration
  def up
    remove_column :intervals, :worker_id
  end

  def down
    add_column :intervals, :worker_id, :integer
  end
end
