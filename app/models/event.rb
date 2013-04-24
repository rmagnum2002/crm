class Event < ActiveRecord::Base
  attr_accessible :action_id, :email, :event_date

  RESULT = {0 => "Problem solved",1 => "Sale",2 => "Send Email",3 => "Make call",
               4 => "Meeting",5 => "Birthday",6 => "Payment order" }
end
