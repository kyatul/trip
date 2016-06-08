class Location < ActiveRecord::Base
  belongs_to :destination
  has_many :reviews
end
