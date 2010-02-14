class Task < ActiveRecord::Base
  STATES = ['Open', 'Done']

  validates_format_of :url, :with => URI::regexp(%w(http https)), :allow_nil => true, :allow_blank => true
  validates_presence_of :type_id

  belongs_to :type
  belongs_to :assignee, :class_name => "User", :foreign_key => "assignee_id"

  def audio_description_file=(input_data)
    self.audio_content_type = input_data.content_type.chomp
    self.audio_description = input_data.read
  end
end
