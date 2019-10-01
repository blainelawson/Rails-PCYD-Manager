# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


DATA = {
  :member_keys =>
    ["name", "phone", "email", "address", "dob", "admin", "password"],
  :members => [
    ["Max Charles", "727-999-5454", "max.charles@gmail.com", "mc address", Date.new(1983, 10, 18), false, "password"],
    ["Skai Jackson", "813-212-4343", "skaij@aol.com", "sj address", Date.new(1982, 10, 20), false, "password"],
    ["Kaleo Elam", "212-222-2345", "ke@hotmail.com", "ke  address", Date.new(1990, 01, 15), false, "password"],
    ["Megan Charpentier", "417-392-3243", "mcharpentier@mail.co", "mc address", Date.new(1991, 12, 26), false, "password"],
    ["Hayden Byerly", "417-343-9999", "hayday@mail.com", "hb address", Date.new(1991, 02, 16),  false,"password"],
    ["Tenzing Norgay Trainor", "407-345-6425", "tnt@go.com", "tnt address", Date.new(1990, 07, 04),  false,"password"],
    ["Davis Cleveland", "546-879-5413", "daviscleveland@hotmail.com", "dc address", Date.new(1985, 05, 05),  false,"password"],
    ["Cole Sand", "879-513-5486", "csand@tb.com", "cs address", Date.new(1987, 05, 06), false, "password"],
    ["Quvenzhané Wallis", "515-587-9865", "qwallis@email.com", "qw address", Date.new(2000, 01, 13), false, "password"],
    ["Blaine Lawson", "417-396-3896", "blaine.lawson@gmail.com", "9113 79th Ave N", Date.new(1983, 10, 18), true, "password"]
  ],
  :director_keys =>
   ["title", "phone", "email"],
  :directors => [
    ["Magic Maker", "727-999-4654", "magic@pcyd.org"],
    ["Enchanteur", "727-417-8130", "enchantments@pcyd.org"]
  ],
  :committees => [
    "Magic Making",
    "Enchantments"
  ],
  :issues => [
    "Climate Change",
    "Healthcare",
    "Education",
    "Gun Control"
  ]
}

def main
  make_members
  make_committees
  make_directors
  make_issues
end

def make_issues
  DATA[:issues].each do |issue|
    Issue.create(key_word: issue)
  end
end

def make_members
  DATA[:members].each do |member|
    new_member = Member.new
    member.each_with_index do |attribute, i|
      new_member.send(DATA[:member_keys][i]+"=", attribute)
    end
    new_member.save
  end
end

def make_committees
  DATA[:committees].each do |committee|
    Committee.create(name: committee)
  end
end

def make_directors
  DATA[:directors].each do |director|
    new_director = Director.new
    director.each_with_index do |attribute, i|
      new_director.send(DATA[:director_keys][i]+"=", attribute)
    end
    new_director.save
  end
end

main
