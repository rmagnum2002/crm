#!/bin/env ruby
# encoding: utf-8

class Event < ActiveRecord::Base
  belongs_to :employee

  attr_accessible :action_id, :email, :event_date, :employee_id, :user_id

  RESULT = {
    0 => :"events.result.problem_solved",
    1 => :"events.result.sale",
    2 => :"events.result.send_email",
    3 => :"events.result.make_call",
    4 => :"events.result.meeting",
    5 => :"events.result.birthday",
    6 => :"events.result.payment_order"}
end
