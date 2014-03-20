# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Ocean.create({:name => 'Atlantic Ocean', :volume => 2, :depth => 1, :ordinal => 1.5})
Ocean.create({:name => 'Pacific Ocean', :volume => 1, :depth => 1, :ordinal => 1.0})
Ocean.create({:name => 'Indian Ocean', :volume => 7, :depth => 3, :ordinal => 1})
Ocean.create({:name => 'Southern Ocean', :volume => 3, :depth => 7, :ordinal => 1.5})