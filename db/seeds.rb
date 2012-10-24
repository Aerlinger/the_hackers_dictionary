# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

primary_categories = ["operating systems", "programming languages", "frameworks", "databases", "software", "tools"]

categories = ["misc", "unix", "linux", "windows", "c", "Hardware", "android", "c++", "python", "ruby", "OSX", "Java",
              "Javascript", "CSS", "lua", "iOS", "Actionscript", "Objective C", "iphone", "Assembly", "Vim", "Ada",
              "Shell", "PHP", "Perl", "C#", "Groovy", "CoffeeScript", "R", "Verilog", "Visual Basic", "Scala"]

categories.each do |category|
  25.times do
    Definition.create( {word: Faker::Internet.domain_word, definition_text: Faker::Lorem.paragraph(3), tags: [category]} )
  end
end

puts "#{categories.size} Categories created"
puts "#{Definition.count} Definitions created"
