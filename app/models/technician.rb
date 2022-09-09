class Technician < ActiveRecord::Base
    has_many :solartypes
    has_many :customers, through: :solartypes
end