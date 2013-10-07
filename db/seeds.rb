# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

INDUSTRIES = Industry.create([{name: "Consulting"}, {name: "CPG, Marketing, Retail"}, {name: "Entrepreneurship"},
                              {name: "Government, Non-Profit"}, {name: "Health Care"},
                              {name: "Investment Banking"}, {name: "Investment Management, Hedge Funds"},
                              {name: "Media, Entertainment"}, {name: "Private Equity, Venture Capital"},
                              {name: "Real Estate"}, {name: "Technology"}, {name: "Other"}])
                              
SPORTS = Sport.create([{name: "Basketball, Football, Baseball, Hockey"}, {name: "Soccer, Rugby"}, {name: "Golf, Tennis"},
                              {name: "Running, Swimming"}, {name: "Winter Sports"},
                              {name: "Hiking, Outdoors"}])
                              
HOBBIES = Hobby.create([{name: "Dancing"}, {name: "Movies, Television"}, {name: "Art, Drawing"},
                              {name: "Music, Singing"}, {name: "Reading, Writing"},
                              {name: "Photography"},
                              {name: "Shopping"}, {name: "Computers, Gaming"},
                              {name: "Traveling"}, {name: "Other"}])
                              
NATIONALITIES = Nationality.create([{name: "North America"}, {name: "East Asia"}, {name: "Southeast Asia"},
                              {name: "South Asia"}, {name: "Europe"},
                              {name: "Middle East"}, {name: "Africa"},
                              {name: "Latin America"}])