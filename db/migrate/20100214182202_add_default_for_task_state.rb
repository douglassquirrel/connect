class AddDefaultForTaskState < ActiveRecord::Migration
  def self.up
    change_column :tasks, :state, :string, { :default => 'Open' }
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration, "Can't remove default"
  end
end
