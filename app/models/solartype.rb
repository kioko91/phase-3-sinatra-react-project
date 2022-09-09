class Solartype < ActiveRecord::Base
    belongs_to :technicians
    belongs_to :customers
end