# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

rooms = Room.create([
  {
    name: "Super Suite",
    address: "Av 43 #222-12",
    description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                  quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                  consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                  cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                  proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    lat: 6.2092599,
    long: -75.5721622
  },
  {
    name: "Simple Single Bedroom",
    address: "Av 43 #222-12",
    description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                  quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                  consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                  cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                  proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    lat: 6.2092599,
    long: -75.5721622
  }
])

RoomAvailability.create([
  {
    room: rooms.first,
    start: DateTime.new(2015,1,19,15),
    hours: 0,
    available: true,
    price: 35000
  },
  {
    room: rooms.last,
    start: DateTime.new(2015,1,19,15),
    hours: 0,
    available: true,
    price: 25000
  },
  {
    room: rooms.last,
    start: DateTime.new(2015,1,19,18),
    hours: 2,
    available: true,
    price: 25000
  }
])
