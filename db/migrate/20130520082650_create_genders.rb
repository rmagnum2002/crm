#!/bin/env ruby
# encoding: utf-8

class CreateGenders < ActiveRecord::Migration
  def change
    create_table :genders do |t|
      t.string :name
      t.string :name_ru
      t.string :name_ro

      t.timestamps
    end
    Gender.new(name: "Male", name_ro: "Masculin", name_ru: "Мужской").save
    Gender.new(name: "Female", name_ro: "Femenin", name_ru: "Женский").save
  end
end
