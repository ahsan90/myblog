# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'
include Faker

100.times do
  post = Post.create(
      :title => "#{Lorem.sentence}",
      :text => Lorem.paragraphs.join("<br/>")
  )
  puts post.inspect
end
