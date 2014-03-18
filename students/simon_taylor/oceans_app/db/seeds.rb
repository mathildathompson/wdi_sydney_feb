# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# data from http://www.infoplease.com/ipa/A0001773.html

Ocean.destroy_all

Ocean.create({:name => "Pacific Ocean", :area => 60060700, :avg_depth => 13215, :greatest_depth => 36198, :where_deepest => "Mariana Trench"})
Ocean.create({:name => "Atlantic Ocean", :area => 29637900, :avg_depth => 12880, :greatest_depth => 30246, :where_deepest => "Puerto Rico Trench"})
Ocean.create({:name => "Indian Ocean", :area => 26469500, :avg_depth => 13002, :greatest_depth => 24460, :where_deepest => "Sunda Trench"})
Ocean.create({:name => "Southern Ocean", :area => 7848300, :avg_depth => 14750, :greatest_depth => 23736, :where_deepest => "South Sandwich Trench"})
Ocean.create({:name => "Arctic Ocean", :area => 5427000, :avg_depth => 3953, :greatest_depth => 18456, :where_deepest => "77°45'N; 175°W"})
Ocean.create({:name => "Mediterranean Sea", :area => 1144800, :avg_depth => 4688, :greatest_depth => 15197, :where_deepest => "Off Cape Matapan, Greece"})
Ocean.create({:name => "Caribbean Sea", :area => 1049500, :avg_depth => 8685, :greatest_depth => 22788, :where_deepest => "Off Cayman Islands"})
Ocean.create({:name => "South China Sea", :area => 895400, :avg_depth => 5419, :greatest_depth => 16456, :where_deepest => "West of Luzon"})
Ocean.create({:name => "Bering Sea", :area => 884900, :avg_depth => 5075, :greatest_depth => 15659, :where_deepest => "Off Buldir Island"})
Ocean.create({:name => "Gulf of Mexico", :area => 615000, :avg_depth => 4874, :greatest_depth => 12425, :where_deepest => "Sigsbee Deep"})
Ocean.create({:name => "Okhotsk Sea", :area => 613800, :avg_depth => 2749, :greatest_depth => 12001, :where_deepest => "146°10'E; 46°50'N"})
Ocean.create({:name => "East China Sea", :area => 482300, :avg_depth => 617, :greatest_depth => 9126, :where_deepest => "25°16'N; 125°E"})
Ocean.create({:name => "Hudson Bay", :area => 475800, :avg_depth => 420, :greatest_depth => 600, :where_deepest => "Near entrance"})
Ocean.create({:name => "Japan Sea", :area => 389100, :avg_depth => 4429, :greatest_depth => 12276, :where_deepest => "Central Basin"})
Ocean.create({:name => "Andaman Sea", :area => 308000, :avg_depth => 2854, :greatest_depth => 12392, :where_deepest => "Off Car Nicobar Island"})
Ocean.create({:name => "North Sea", :area => 222100, :avg_depth => 308, :greatest_depth => 2165, :where_deepest => "Skagerrak"})
Ocean.create({:name => "Red Sea", :area => 169100, :avg_depth => 1611, :greatest_depth => 7254, :where_deepest => "Off Port Sudan"})
Ocean.create({:name => "Baltic Sea", :area => 163000, :avg_depth => 180, :greatest_depth => 1380, :where_deepest => "Off Gotland"})