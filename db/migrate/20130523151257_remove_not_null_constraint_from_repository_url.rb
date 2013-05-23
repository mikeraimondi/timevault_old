class RemoveNotNullConstraintFromRepositoryUrl < ActiveRecord::Migration
  def up
    change_column :repositories, :url, :string, :null => true
  end

  def down
    change_column :repositories, :url, :string, :null => false
  end
end
