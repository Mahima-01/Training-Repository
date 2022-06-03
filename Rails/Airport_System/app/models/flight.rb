class Flight < ApplicationRecord
  has_one :aircraft
end

# A has_one association indicates that one other model has a reference to this model. That model can be fetched through this association.
# A has_one :through association sets up a one-to-one connection with another model.

