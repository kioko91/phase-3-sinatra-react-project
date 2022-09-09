class Customer < ActiveRecord::Base
    has_many :solartypes
    has_many :technicians, through: :solartypes
  end