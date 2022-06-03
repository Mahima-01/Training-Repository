class Aircraft < ApplicationRecord
  has_many :flights_aircrafts
  has_many :flights, through: :flights_aircrafts
end

# Has_many: through association sets up a many-to-many association using another model. 
#It creates direct many-to-many connections with another model
# In this association, we need three models to make it work.

