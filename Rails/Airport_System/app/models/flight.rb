class Flight < ApplicationRecord
  has_many :aircrafts
  has_many :flights_aircrafts
  has_many :aircrafts, through: :flights_aircrafts
end



