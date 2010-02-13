class AddAssigneeToTask < ActiveRecord::Migration
  def self.up
    add_column :tasks, :assignee_id, :integer
  end

  def self.down
    remove_column :tasks, :assignee_id
  end
end
