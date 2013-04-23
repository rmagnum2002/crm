class Event < ActiveRecord::Base
  attr_accessible :action_id, :email, :event_date
end
