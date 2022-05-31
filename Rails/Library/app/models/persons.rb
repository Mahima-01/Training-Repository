class Persons < ApplicationRecord
  validates :name, exclusion: { in: %w[Mahima Rishabh] }
end


=begin
# Exclusion:
With exclusion you can validate the value for the attribute you're specifying doesn't take the value of any of those for the in option.

3.0.0 :005 > person.errors[:name]
 => ["is reserved"] 
 3.0.0 :006 > person.name = "Lalit"
 => "Lalit" 
3.0.0 :007 > person.valid?
 => true 
3.0.0 :008 > person.name = "Rishabh"
 => "Rishabh" 
3.0.0 :009 > person.valid?
 => false 
 3.0.0 :010 > person.errors[:name]
 => ["is reserved"] 
=end

