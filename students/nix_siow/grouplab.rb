
def n_people(n)
    wdi4 = ["Anne", "Charlie", "Kriss" , "Mark", "Nix", "Simon", "Olly", "Tom", "Erik"]
    wdi4.shuffle.each_slice(n).to_a   
end

puts "How many people you want to put in a group?"


choice = gets.chomp.to_i

groups = n_people(choice)


if groups.last.size < choice
    groups[-2] << groups.pop
    groups.last.flatten!
end

# Print each group
groups.each do |group|
    print "New group: "
    puts group.join ', ' # Read the docs for .join
end

