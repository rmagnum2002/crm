class Comment < ActiveRecord::Base
  attr_accessible :content, :result_id, :result_date, :result_time
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  TYPE = { "Call" => 0, "Email" => 1, "Meeting" => 2}

  RESULT = {0 => "Problem solved",1 => "Sale",2 => "Send Email",3 => "Make call",
               4 => "Meeting",5 => "Birthday",6 => "Payment order" }
end
