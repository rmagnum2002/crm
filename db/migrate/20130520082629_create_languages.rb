#!/bin/env ruby
# encoding: utf-8

class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :name
      t.string :name_ru
      t.string :name_ro

      t.timestamps
    end
    Language.new(name: "English", name_ro: "Engleză", name_ru: "Английский").save
    Language.new(name: "Romanian", name_ro: "Română", name_ru: "Румынский").save
    Language.new(name: "Russian", name_ro: "Rusă", name_ru: "Русский").save
  end
end
