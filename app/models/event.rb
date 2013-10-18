#!/bin/env ruby
# encoding: utf-8

class Event < ActiveRecord::Base
  belongs_to :employee
  belongs_to :comment

  attr_accessible :action_id, :email, :event_date, :employee_id, :user_id, :comment_id

  before_create :update_date_event
  validates_presence_of :action_id
  # after_create :create_activity

  RESULT = {
    0 => :"events.result.problem_solved",
    # 1 => :"events.result.sale",
    2 => :"events.result.send_email",
    3 => :"events.result.make_call",
    4 => :"events.result.meeting",
    5 => :"events.result.birthday",
    6 => :"events.result.payment_order"}

  def update_date_event
    if self.event_date == nil
      self.event_date = Time.now
    end
  end

  # def create_activity
  #   Activity.new(user_id: self.user_id, action: 'create', trackable_id: self.id, trackable_type: "Event").save
  # end

end
