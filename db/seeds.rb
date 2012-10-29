# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Definition.delete_all
Category.delete_all
User.delete_all

primary_categories = ["operating systems", "programming languages", "frameworks", "databases", "software", "tools"]

categories = ["misc", "unix", "linux", "windows", "c", "Hardware", "android", "c++", "python", "ruby", "OSX", "Java",
              "Javascript", "CSS", "lua", "iOS", "Actionscript", "Objective C", "iphone", "Assembly", "Vim", "Ada",
              "Shell", "PHP", "Perl", "C#", "Groovy", "CoffeeScript", "R", "Verilog", "Visual Basic", "Scala", "Shell",
              "XSLT", "VHDL", "Rails"]

admin = User.new(password: "secret")
admin.username = "admin"
admin.password = "password"
admin.password_confirmation = "password"
admin.email = "admin@thehackersdictionary.com"
admin.save!

5.times do |num|
  user = User.new
  user.username = "user#{num}"
  user.password = "password"
  user.email = "user#{num}@thehackersdictionary.com"
  user.password_confirmation = "password"
  user.save!
end

2000.times do
  Definition.create!( word: Faker::Internet.domain_word, definition_text: Faker::Lorem.paragraph(3), tags: categories.shuffle[1..(1+rand(4))] )
end

puts "#{User.count} #{ "User".pluralize(User.count) } created"
puts "#{Category.count} Categories created"
puts "#{Definition.count} Definitions created"
