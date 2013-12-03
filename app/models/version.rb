#!/bin/env ruby
# encoding: utf-8

class Version < ActiveRecord::Base
  attr_accessor :ip, :admin_user
  attr_accessible :ip, :admin_user
end
