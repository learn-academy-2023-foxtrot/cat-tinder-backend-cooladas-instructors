# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

rappers = [
  {
    name:'Bone Mumble',
    age: 27,
    enjoys:'snacks and bars',
    image: 'https://consequence.net/wp-content/uploads/2014/04/drakesimpsons.jpg'
  },
  {
    name: 'R TUNE U',
    age: 42,
    enjoys: 'eating whack rappers for breakfast',
    image: 'https://i0.wp.com/i.pinimg.com/originals/60/1d/7d/601d7d19cf4155d147dddafbb510a82d.jpg'
  },
  {
    name: 'Madam',
    age: 45,
    enjoys: 'Leaving chalk dust on the pupils',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJx3jKJ5J4RQDAiflTfXlzni6x1vB-edDb5Q&usqp=CAU'
  },
  {
    name: 'MC SuchAndSuch',
    age: 18,
    enjoys: 'Rap after chilled glass bottles of water ',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRA1NIrhdEjWDY3McV488Xya3TvmIhcCOhevA&usqp=CAU'
  }
]

rappers.each do |each_rapper|
  FlowMaster.create each_rapper
  puts "creating flow master #{each_rapper}"
end