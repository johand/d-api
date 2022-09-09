# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!([{
               username: 'foobar',
               email: 'foo@foo.com',
               password: '12345678',
               password_confirmation: '12345678'
             },
              {
                username: 'barfoo',
                email: 'bar@bar.com',
                password: '12345678',
                password_confirmation: '12345678'
              }])

Genre.create!([{
                name: 'action',
                image: Faker::LoremFlickr.image,
                user_id: User.first.id
              },
               {
                 name: 'fantasy',
                 image: Faker::LoremFlickr.image,
                 user_id: User.first.id
               },
               {
                 name: 'adventure',
                 image: Faker::LoremFlickr.image,
                 user_id: User.first.id
               },
               {
                 name: 'science fiction',
                 image: Faker::LoremFlickr.image,
                 user_id: User.first.id
               },
               {
                 name: 'terror',
                 image: Faker::LoremFlickr.image,
                 user_id: User.first.id
               },
               {
                 name: 'zombie',
                 image: Faker::LoremFlickr.image,
                 user_id: User.first.id
               },
               {
                 name: 'thriller',
                 image: Faker::LoremFlickr.image,
                 user_id: User.first.id
               },
               {
                 name: 'mistery',
                 image: Faker::LoremFlickr.image,
                 user_id: User.first.id
               },
               {
                 name: 'superheros',
                 image: Faker::LoremFlickr.image,
                 user_id: User.last.id
               },
               {
                 name: 'drama',
                 image: Faker::LoremFlickr.image,
                 user_id: User.last.id
               },
               {
                 name: 'post apocalyptic',
                 image: Faker::LoremFlickr.image,
                 user_id: User.last.id
               },
               {
                 name: 'suspense',
                 image: Faker::LoremFlickr.image,
                 user_id: User.last.id
               }])

avengers = Movie.create!(
  image: 'https://static.wikia.nocookie.net/marvelcinematicuniverse/images/d/d0/Theavengersnewposter.jpg',
  title: 'The Avengers',
  date: DateTime.new(2012, 4, 27, 0, 0, 0, 0),
  qualification: 4,
  user_id: User.first.id
)

avengers.genres << Genre.find_by(name: 'action')
avengers.genres << Genre.find_by(name: 'fantasy')
avengers.genres << Genre.find_by(name: 'adventure')
avengers.genres << Genre.find_by(name: 'superheros')
avengers.genres << Genre.find_by(name: 'adventure')

avengers_characters =
  [{
    image: 'https://static.wikia.nocookie.net/marvelcinematicuniverse/images/3/35/IronMan-EndgameProfile.jpg',
    name: 'Iron Man',
    age: 30,
    weight: 72,
    history: "Anthony Edward Stark was a billionaire industrialist, a\
 founding member of the Avengers, and the former CEO of Stark Industries.\
 A brash but brilliant inventor, Stark was self-described as a genius,\
 billionaire, playboy, and philanthropist.",
    user_id: User.first.id
  },
   {
     image: 'https://static.wikia.nocookie.net/marvelcinematicuniverse/images/d/d7/CapAmerica-EndgameProfile.jpg',
     name: 'Captain America',
     age: 28,
     weight: 68,
     history: "Captain Steven Grant Rogers is a World War II veteran,\
 a founding member of the Avengers, and Earth's first known superhero.\
 Rogers grew up suffering from numerous health problems, and upon America's\
 entry into World War II, he was rejected from serving in the United States\
 Army despite several attempts to enlist.",
     user_id: User.first.id
   },
   {
     image: 'https://static.wikia.nocookie.net/marvelcinematicuniverse/images/2/22/Thor_in_LoveAndThunder_Poster.jpg',
     name: 'Thor',
     age: 30,
     weight: 68,
     history: "Thor Odinson is the Asgardian God of Thunder, the former\
 king of Asgard and New Asgard, and a founding member of the Avengers.\
 When his irresponsible and impetuous behavior reignited an ancient war\
 between Asgard and Jotunheim, Thor was denied the right to become king,\
 stripped of his power and hammer Mjølnir, and banished to Earth by Odin.",
     user_id: User.first.id
   }]

avengers.characters.create!(avengers_characters)

avgultron = Movie.create!(
  image: 'https://static.wikia.nocookie.net/marvelcinematicuniverse/images/c/c7/Avengers_Age_Of_Ultron-poster1.jpg',
  title: 'Avengers Age Of Ultron',
  date: DateTime.new(2015, 5, 1, 0, 0, 0, 0),
  qualification: 3,
  user_id: User.first.id
)

avgultron.genres << Genre.find_by(name: 'action')
avgultron.genres << Genre.find_by(name: 'superheros')
avgultron.genres << Genre.find_by(name: 'science fiction')
avgultron.genres << Genre.find_by(name: 'adventure')

avgultron.characters << Character.where(name: 'Iron Man')
avgultron.characters << Character.where(name: 'Captain America')
avgultron.characters << Character.where(name: 'Thor')

infinity_war = Movie.create!(
  image: 'https://static.wikia.nocookie.net/marvelcinematicuniverse/images/1/11/Avengers_Infinity_war_poster.jpeg',
  title: 'Avengers Infinity War',
  date: DateTime.new(2018, 4, 23, 0, 0, 0, 0),
  qualification: 4,
  user_id: User.first.id
)

infinity_war.genres << Genre.find_by(name: 'action')
infinity_war.genres << Genre.find_by(name: 'superheros')
infinity_war.genres << Genre.find_by(name: 'science fiction')

infinity_war.characters << Character.find_by(name: 'Iron Man')
infinity_war.characters << Character.find_by(name: 'Captain America')
infinity_war.characters << Character.find_by(name: 'Thor')

avgegame = Movie.create!(
  image: 'https://static.wikia.nocookie.net/marvelcinematicuniverse/images/9/91/Endgame_Poster_2.jpg',
  title: 'Avengers Endgame',
  date: DateTime.new(2019, 4, 26, 0, 0, 0, 0),
  qualification: 3,
  user_id: User.first.id
)

avgegame.genres << Genre.find_by(name: 'action')
avgegame.genres << Genre.find_by(name: 'adventure')
avgegame.genres << Genre.find_by(name: 'superheros')
avgegame.genres << Genre.find_by(name: 'science fiction')
avgegame.genres << Genre.find_by(name: 'fantasy')

avgegame.characters << Character.find_by(name: 'Iron Man')
avgegame.characters << Character.find_by(name: 'Captain America')
avgegame.characters << Character.find_by(name: 'Thor')

ds = Movie.create!(
  image: 'https://static.wikia.nocookie.net/marvelmovies/images/8/89/Doctor_Strange_Poster.jpg',
  title: 'Doctor Strange',
  date: DateTime.new(2016, 11, 4, 0, 0, 0, 0),
  qualification: 5,
  user_id: User.last.id
)

ds.genres << Genre.find_by(name: 'action')
ds.genres << Genre.find_by(name: 'science fiction')
ds.genres << Genre.find_by(name: 'superheros')
ds.genres << Genre.find_by(name: 'fantasy')
ds.genres << Genre.find_by(name: 'adventure')

ds.characters << Character.find_by(name: 'Thor')
ds.characters.create!(
  [{
    image: 'https://static.wikia.nocookie.net/marvelmovies/images/7/79/Multiverse_of_Madness_Character_Posters_06.jpg',
    name: 'Stephen Strange',
    age: 35,
    weight: 74,
    history: "Dr. Stephen Vincent Strange is a world renowned neurosurgeon until\
 a tragic accident cost him his medical skills and career. Searching for a way to\
 restore his talents, he traveled the world; until he finally encountered the\
 Ancient One, the enigmatic teacher who offered to teach him the ways of the mystic arts.",
    user_id: User.last.id
  },
   {
     image: 'https://static.wikia.nocookie.net/marvelmovies/images/d/dc/Ancient_One.png',
     name: 'Ancient One',
     age: 29,
     weight: 66,
     history: "The Ancient One was the Sorcerer Supreme, the leader of\
 the Masters of the Mystic Arts and the mentor of Stephen Strange.\
 As the Sorcerer Supreme and the leader of the Masters of the Mystic\
 Arts, the Ancient One was the most powerful member of the order,\
 possessing tremendously mastery and knowledge of the mystic arts,\
 which she uses to defend his native reality.",
     user_id: User.last.id
   }]
)

tron = Movie.create!(
  image: 'https://static.wikia.nocookie.net/tron/images/2/28/Tron_poster1.jpg',
  title: 'TRON',
  date: DateTime.new(1982, 7, 9, 0, 0, 0, 0),
  qualification: 3,
  user_id: User.last.id
)

tron.genres << Genre.find_by(name: 'science fiction')
tron.genres << Genre.find_by(name: 'action')
tron.genres << Genre.find_by(name: 'adventure')
tron.genres << Genre.find_by(name: 'fantasy')

tron.characters.create!(
  [{
    image: 'https://static.wikia.nocookie.net/tron/images/c/ce/Flynn.jpg',
    name: 'Kevin Flynn',
    age: 33,
    weight: 62,
    history: "Was a gifted computer programmer who, in 1982, created\
 some best-selling video games for ENCOM which included Space\
 Paranoids, Matrix Blaster, Vice Squad, and Light Cycles.\
 As he developed his games, the code he wrote was stolen by fellow\
 ENCOM programmer Ed Dillinger. Flynn was fired shortly after Dillinger\
 became Executive VP. Later, as the VP of Creative\
 Development, Flynn created TRON ",
    user_id: User.last.id
  },
   {
     image: 'https://static.wikia.nocookie.net/tron/images/e/ee/Dumont.png',
     name: 'Dumont',
     age: 29,
     weight: 60,
     history: "Dumont is a Tower Guardian charged with protecting the ENCOM\
 mainframe's I/O Tower. He resembles his user, Encom founder Walter\
 Gibbs, and has a similar closeness with Yori that Gibbs had with her\
 user, Lora Baines.",
     user_id: User.last.id
   },
   {
     image: 'https://static.wikia.nocookie.net/tron/images/0/0b/Yori3.jpg',
     name: 'Yori',
     age: 27,
     weight: 66,
     history: "Yori is a program written by Lora Baines and the romantic\
 interest of Tron. She was in charge of the creation of digital simulations\
 (such as the Solar Sailer) and involved in the operation of the digitizing laser. ",
     user_id: User.last.id
   }]
)

tlegacy = Movie.create!(
  image: 'https://static.wikia.nocookie.net/tron/images/4/40/Newpostertron.jpg',
  title: 'TRON Legacy',
  date: DateTime.new(2010, 12, 17, 0, 0, 0, 0),
  qualification: 4,
  user_id: User.last.id
)

tlegacy.genres << Genre.find_by(name: 'action')
tlegacy.genres << Genre.find_by(name: 'science fiction')
tlegacy.genres << Genre.find_by(name: 'adventure')
tlegacy.genres << Genre.find_by(name: 'fantasy')

tlegacy.characters << Character.find_by(name: 'Kevin Flynn')
tlegacy.characters.create!(
  [{
    image: 'https://static.wikia.nocookie.net/tron/images/b/bf/Sam_flynn2.jpg',
    name: 'Sam Flynn',
    age: 27,
    weight: 50,
    history: "Sam was born in 1983[1] to then-famous video game creator\
 and ENCOM CEO Kevin Flynn and architect Jordan Canas. In 1985, Jordan\
 was killed in a car accident, leaving Kevin to raise Sam on his own.\
 Due to Kevin's absences from the real world, a large part of Sam's\
 childhood was spent in the company of his mother's parents,\
 who raised him in his place. ",
    user_id: User.last.id
  },
   {
     image: 'https://static.wikia.nocookie.net/tron/images/6/69/Quorrapromo.png',
     name: 'Quorra',
     age: 32,
     weight: 67,
     history: "Quorra is the confidante and apprentice of Kevin Flynn.\
 Flynn has shared his knowledge of the real world with her, and as such,\
 she longs to experience what lies outside the realm of possibility in\
 her own world. She is the last known ISO alive and is referred to by\
 Kevin Flynn as The Miracle. ",
     user_id: User.last.id
   }]
)

sw = Movie.create!(
  image: 'https://static.wikia.nocookie.net/starwars/images/0/06/Star_Wars_Style_A_poster_1977.jpg',
  title: 'Star Wars Episode IV',
  date: DateTime.new(1977, 5, 25, 0, 0, 0, 0),
  qualification: 5,
  user_id: User.first.id
)

sw.genres << Genre.find_by(name: 'science fiction')
sw.genres << Genre.find_by(name: 'action')
sw.genres << Genre.find_by(name: 'fantasy')
sw.genres << Genre.find_by(name: 'adventure')

sw.characters.create!(
  [{
    image: 'https://static.wikia.nocookie.net/starwars/images/3/3d/LukeSkywalker.png',
    name: 'Luke Skywalker',
    age: 30,
    weight: 78,
    history: "Luke Skywalker, a Force-sensitive human male, was a\
 legendary Jedi Master who fought in the Galactic Civil War during the reign of the Galactic Empire",
    user_id: User.first.id
  },
   {
     image: 'https://static.wikia.nocookie.net/starwars/images/f/f1/Leia_Organa_TROS.png',
     name: 'Leia Organa',
     age: 31,
     weight: 67,
     history: 'Leia Skywalker Organa Solo was a Force-sensitive\
 human female political and military leader who served in the Alliance to Restore\
 the Republic during the Imperial Era and the New Republic and Resistance in the\
 subsequent New Republic Era',
     user_id: User.first.id
   },
   {
     image: 'https://static.wikia.nocookie.net/starwars/images/6/6f/Anakin_Skywalker_RotS.png',
     name: 'Anakin Skywalker',
     age: 32,
     weight: 71,
     history: "Anakin Skywalker was a legendary Force-sensitive\
 His alter ego, Darth Vader, the Dark Lord of the Sith, was created when\
 Skywalker turned to the dark side of the Force, pledging his allegiance\
 to the Sith Lord Darth Sidious at the end of the Republic Era",
     user_id: User.first.id
   }]
)

dlater = Movie.create!(
  image: 'https://static.wikia.nocookie.net/28dayslater/images/0/0c/28dayslater_poster-1-.jpg',
  title: '28 Days Later',
  date: DateTime.new(2002, 11, 1, 0, 0, 0, 0),
  qualification: 3,
  user_id: User.last.id
)

dlater.genres << Genre.find_by(name: 'terror')
dlater.genres << Genre.find_by(name: 'zombie')
dlater.genres << Genre.find_by(name: 'post apocalyptic')
dlater.genres << Genre.find_by(name: 'science fiction')
dlater.genres << Genre.find_by(name: 'drama')
dlater.genres << Genre.find_by(name: 'thriller')

dlater.characters.create!(
  [{
    image: 'https://static.wikia.nocookie.net/28dayslater/images/c/c0/Jim_28dl.jpg',
    name: 'Jim',
    age: 24,
    weight: 58,
    history: "Jim was a bicycle courier for an unknown company. One day,\
 while he was delivering a package from Farrington to Shaftsbury Avenue,\
 a car cut across him, causing him to crash his bike and leaving him comatose.\
 While Jim was unconscious, his parents visited him. As people infected by the\
 Rage virus overran London, hospital staff emptied out the hospital. Someone\
 locked the door, slipped a key under it in case Jim woke up, and he was left behind.",
    user_id: User.last.id
  },
   {
     image: 'https://static.wikia.nocookie.net/28dayslater/images/3/3c/28DaysSelenaEnd.png',
     name: 'Selena',
     age: 21,
     weight: 62,
     history: "Selena is a survivor of the Rage Virus after it originally decimated\
 Great Britain. She is the widow of the late David, and the love interest of Jim\
 and later Clint Harris. She is also one of the Manchester Three.",
     user_id: User.last.id
   },
   {
     image: 'https://static.wikia.nocookie.net/28dayslater/images/b/b1/Henry_West.png',
     name: 'Henry West',
     age: 30,
     weight: 62,
     history: "Major Henry West was the commanding officer of a squad of soldiers\
 who survived the Original Outbreak of the Rage Virus, but was apparently driven\
 insane. He was mauled to death by the infected Mailer.",
     user_id: User.last.id
   }]
)

ssense = Movie.create!(
  image: 'https://static.wikia.nocookie.net/unbreakablemovie/images/6/66/The_sixth_sense.jpg',
  title: 'The Sixth Sense',
  date: DateTime.new(1999, 10, 27, 0, 0, 0, 0),
  qualification: 3,
  user_id: User.last.id
)

ssense.genres << Genre.find_by(name: 'terror')
ssense.genres << Genre.find_by(name: 'mistery')
ssense.genres << Genre.find_by(name: 'thriller')
ssense.genres << Genre.find_by(name: 'suspense')
ssense.genres << Genre.find_by(name: 'drama')

ssense.characters.create!(
  [{
    image: 'https://static.wikia.nocookie.net/unbreakablemovie/images/5/59/F68055971111e177f5116fd2f348d3e2.jpg',
    name: 'Malcolm Crowe ',
    age: 34,
    weight: 58,
    history: "The next fall, Crowe begins working with another patient,\
 nine-year-old Cole Sear, whose case is similar to Vincent's.\
 Crowe becomes dedicated to the boy, though he is haunted by doubts\
 over his ability to help him after his failure with Vincent.",
    user_id: User.last.id
  },
   {
     image: 'https://static.wikia.nocookie.net/unbreakablemovie/images/9/98/The-sixth-sense-1.jpg',
     name: 'Cole Sear',
     age: 10,
     weight: 35,
     history: "Cole is an 11-year-old who has a sixth sense, a sense\
 in which he actually can see the ghosts of the undead, who are always\
 coming to him but is too afraid to approach them. Dr. Malcolm Crowe, a\
 child psychologist in Philadelphia, who comes across his case, decides\
 to help him, due to the fact Cole is going through a similar situation\
 as a previous patient of his, named Vincent.",
     user_id: User.last.id
   },
   {
     image: 'https://static.wikia.nocookie.net/unbreakablemovie/images/1/1c/Profile-ezone-original.jpg',
     name: 'Lynn Sear',
     age: 30,
     weight: 62,
     history: "Lynn was the mother of Cole. On the way home Lynn was in\
 a line because there was a crash, Cole confesses his secret to his\
 mother, Lynn. Although his mother at first does not believe\
 him, he proves his ability to her, and Lynn tearfully accepts the truth.",
     user_id: User.last.id
   }]
)
