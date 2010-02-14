class AddContentTypeToTask < ActiveRecord::Migration
  def self.up
    add_column :tasks, :audio_content_type, :string
  end

  def self.down
    remove_column :tasks, :audio_content_type
  end
end
