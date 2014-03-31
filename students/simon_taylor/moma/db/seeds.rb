# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Artist.destroy_all
Work.destroy_all

a1 = Artist.create({:name => 'Joan Miro', :nationality => 'Spanish', :dob => '1983/04/20', :period => '20th Century', 
  :image => 'http://uploads0.wikipaintings.org/images/joan-miro(1).jpg!Portrait.jpg'})

a2 = Artist.create({:name=>"Salvador Dali", :period=>"20th Century", :nationality=>"Spanish", :dob=>"1989-01-23", 
  :image=>"http://upload.wikimedia.org/wikipedia/commons/2/27/Salvador_Dali_NYWTS.jpg"})

w1 = Work.create(:title => 'The Flight of the Dragonfly in Front of the Sun', :year => 1968, :medium => 'Oil on canvas', 
  :style => 'Abstract', :image => 'http://uploads0.wikipaintings.org/images/joan-miro/the-flight-of-the-dragonfly-in-front-of-the-sun.jpg')

w2 = Work.create({:title => 'The Persistence of Memory', :year => 1931, :medium => 'Oil on Canvas', :style =>'Surrealist',
 :image =>'http://uploads5.wikipaintings.org/images/salvador-dali/the-persistence-of-memory-1931.jpg'})

a1.works << w1
a2.works << w2