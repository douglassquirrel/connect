class Task < ActiveRecord::Base
  STATES = ['Open', 'Done']
  validates_format_of :url, :with => URI::regexp(%w(http https))
  belongs_to :type
  validates_presence_of :type_id
end
