class Task < ActiveRecord::Base
  STATES = ['Open', 'Done']
  validates_format_of :url, :with => URI::regexp(%w(http https))
end
