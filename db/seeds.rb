# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

rappers = [
  {
    name:'BoneCrumble',
    age: 27,
    enjoys:'snacks and bars',
    image: 'https://images.unsplash.com/photo-1497562187797-ec8cb333f512?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8cmFwcGVyJTIwd2l0aCUyMHZpdGFtaW5zfGVufDB8fDB8fHww&auto=format&fit=crop&w=400&q=60'
  },
  {
    name: 'RTO',
    age: 42,
    enjoys: 'eating whack rappers for breakfast',
    image: 'https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1015&q=80'
  },
  {
    name: 'Madam',
    age: 45,
    enjoys: 'Leaving chalk dust on the pupils',
    image: 'https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1049&q=80'
  },
  {
    name: 'MC SuchAndSuch',
    age: 18,
    enjoys: 'Rap after chilled glass bottles of water ',
    image: 'https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1049&q=80'
  }
]

rappers.each do |each_rapper|
  FlowMaster.create each_rapper
  puts "creating flow master #{each_rapper}"
end