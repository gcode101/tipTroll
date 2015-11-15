# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
professionals = [["Michael Jordan", "basketball player","400 NW 26th St, Miami, FL 33127"], ["Pitbull","singer"], [],[] ]

job_title = ["Bar_Tender", "Striper"]

professionals.each do |pro|
	Professional.create(name: pro[0], job_title: pro[1])
end
