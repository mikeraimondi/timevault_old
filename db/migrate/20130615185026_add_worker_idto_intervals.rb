class AddWorkerIdtoIntervals < ActiveRecord::Migration
  def up
    add_column :intervals, :worker_id, :integer
  end

  def down
    remove_column :intervals, :worker_id
  end
end
