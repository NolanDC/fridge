# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


door = Door.create(name: 'First Door')

words = %w(
man
the
cat
dog
chicken
ate
looked
at
the
a
car
metal
ran
swam
fly
plane
moon
left
woman
wife
girl
boy
computer
)

words.each do |word|
  door.magnets.create(word: word, x: rand(1300), y: rand(750))
end