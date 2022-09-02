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

Genre.create!(name: 'action',
              image: Faker::LoremFlickr.image,
              user_id: User.first.id)

Genre.create!(name: 'fantasy',
              image: Faker::LoremFlickr.image,
              user_id: User.first.id)

Genre.create!(name: 'adventure',
              image: Faker::LoremFlickr.image,
              user_id: User.first.id)

Genre.create!(name: 'science fiction',
              image: Faker::LoremFlickr.image,
              user_id: User.first.id)

Genre.create!(name: 'comedy',
              image: Faker::LoremFlickr.image,
              user_id: User.first.id)

Genre.create!(name: 'terror',
              image: Faker::LoremFlickr.image,
              user_id: User.first.id)

Genre.create!(name: 'thriller',
              image: Faker::LoremFlickr.image,
              user_id: User.first.id)

Genre.create!(name: 'crime',
              image: Faker::LoremFlickr.image,
              user_id: User.first.id)

Genre.create!(name: 'superheros',
              image: Faker::LoremFlickr.image,
              user_id: User.last.id)

Genre.create!(name: 'war',
              image: Faker::LoremFlickr.image,
              user_id: User.last.id)

Genre.create!(name: 'drama',
              image: Faker::LoremFlickr.image,
              user_id: User.last.id)

Genre.create!(name: 'sports',
              image: Faker::LoremFlickr.image,
              user_id: User.last.id)

Genre.create!(name: 'romantic',
              image: Faker::LoremFlickr.image,
              user_id: User.last.id)

Genre.create!(name: 'suspense',
              image: Faker::LoremFlickr.image,
              user_id: User.last.id)

Genre.create!(name: 'supernatural',
              image: Faker::LoremFlickr.image,
              user_id: User.last.id)

Genre.create!(name: 'martial arts',
              image: Faker::LoremFlickr.image,
              user_id: User.last.id)

lodr = Movie.create!(
  image: 'https://static.wikia.nocookie.net/lotr/images/7/74/LOTRFOTRmovie.jpg',
  title: 'Lord of the rings',
  date: DateTime.civil(2001, 12, 19, 0, 0, 0, 0),
  qualification: 4,
  user_id: User.first.id
)

lodr.genres << Genre.find_by(name: 'action')
lodr.genres << Genre.find_by(name: 'fantasy')
lodr.genres << Genre.find_by(name: 'adventure')

lodr.characters.create!(
  image: 'https://static.wikia.nocookie.net/lotr/images/1/1a/FotR_-_Elijah_Wood_as_Frodo.png',
  name: 'Frodo Baggins',
  age: 30,
  weight: 72,
  history: "Son of Drogo Baggins, was aa hobbit of the Shire in the late Third Age.\
He was a Ring-bearer, best friend to his gardener, Samwise Gamgee, and one of three hobbits who sailed\
 from Middle-earth to the Uttermost West at the end of the Third Age",
  user_id: User.first.id
)

lodr.characters.create!(
  image: 'https://static.wikia.nocookie.net/lotr/images/e/e7/Gandalf_the_Grey.jpg',
  name: 'Gandalf',
  age: 75,
  weight: 68,
  history: "Gandalf the Grey, later known as Gandalf the White, He joined\
 Thorin II Oakenshield and his company to reclaim the Lonely Mountain from Smaug",
  user_id: User.first.id
)

lodr.characters.create!(
  image: 'https://static.wikia.nocookie.net/lotr/images/3/33/Legolas_-_in_Two_Towers.PNG',
  name: 'Legolas',
  age: 100,
  weight: 68,
  history: "Legolas was Mirkwood's prince, a messenger, and a master\
archer. With his keen eyesight, sensitive hearing, and excellent bowmanship, Legolas was\
valuable to the Fellowship in their journey across Middle-earth",
  user_id: User.first.id
)

sw = Movie.create!(
  image: 'https://static.wikia.nocookie.net/starwars/images/0/06/Star_Wars_Style_A_poster_1977.jpg',
  title: 'Star wars episode IV',
  date: DateTime.civil(1977, 5, 25, 0, 0, 0, 0),
  qualification: 5,
  user_id: User.first.id
)

sw.genres << Genre.find_by(name: 'science fiction')
sw.genres << Genre.find_by(name: 'action')
sw.genres << Genre.find_by(name: 'fantasy')
sw.genres << Genre.find_by(name: 'adventure')

sw.characters.create!(
  image: 'https://static.wikia.nocookie.net/starwars/images/3/3d/LukeSkywalker.png',
  name: 'Luke Skywalker',
  age: 30,
  weight: 78,
  history: "Luke Skywalker, a Force-sensitive human male, was a\
legendary Jedi Master who fought in the Galactic Civil War during the reign of the Galactic Empire",
  user_id: User.first.id
)

sw.characters.create!(
  image: 'https://static.wikia.nocookie.net/starwars/images/f/f1/Leia_Organa_TROS.png',
  name: 'Leia Organa',
  age: 31,
  weight: 67,
  history: 'Leia Skywalker Organa Solo was a Force-sensitive\
human female political and military leader who served in the Alliance to Restore\
the Republic during the Imperial Era and the New Republic and Resistance in the\
subsequent New Republic Era',
  user_id: User.first.id
)

sw.characters.create!(
  image: 'https://static.wikia.nocookie.net/starwars/images/6/6f/Anakin_Skywalker_RotS.png',
  name: 'Anakin Skywalker',
  age: 32,
  weight: 71,
  history: "Anakin Skywalker was a legendary Force-sensitive\
His alter ego, Darth Vader, the Dark Lord of the Sith, was created when\
Skywalker turned to the dark side of the Force, pledging his allegiance\
to the Sith Lord Darth Sidious at the end of the Republic Era",
  user_id: User.first.id
)

bttf = Movie.create!(
  image: 'https://static.wikia.nocookie.net/bttf/images/9/91/17B978EC-5AFA-4206-9A27-87DB74D6E05D.jpeg',
  title: 'Back to the future',
  date: DateTime.civil(1985, 7, 3, 0, 0, 0, 0),
  qualification: 3,
  user_id: User.first.id
)

bttf.genres << Genre.find_by(name: 'science fiction')
bttf.genres << Genre.find_by(name: 'comedy')
bttf.genres << Genre.find_by(name: 'romantic')
bttf.genres << Genre.find_by(name: 'fantasy')
bttf.genres << Genre.find_by(name: 'adventure')

bttf.characters.create!(
  image: 'https://static.wikia.nocookie.net/bttf/images/e/e5/Martyvest1955.jpg',
  name: 'Marty McFly',
  age: 17,
  weight: 62,
  history: "He is the world's second time traveler (after Einstein),\
the first to travel to the past, and the first human to travel\
through time. He was also a high school student at Hill Valley\
High School in 1985. He was best friends with\
 Dr. Emmett Brown, who unveiled his first working invention to him",
  user_id: User.first.id
)

bttf.characters.create!(
  image: 'https://static.wikia.nocookie.net/bttf/images/9/96/Doc_Emmett_Brown.jpg',
  name: 'Emmett Lathrop',
  age: 71,
  weight: 70,
  history: "Dr. Emmett Lathrop 'Doc' Brown is a resident of Hill\
Valley, California. He was the inventor of the DeLorean time\
machine. He is the world's third time traveler\
(after Einstein and Marty McFly), the second to travel forwards\
in time (after Einstein), the first human to travel forwards in\
time, and the second human to travel through time (after Marty)",
  user_id: User.first.id
)

bttf.characters.create!(
  image: 'https://static.wikia.nocookie.net/bttf/images/9/96/Doc_Emmett_Brown.jpg',
  name: 'Buford Howard Tannen',
  age: 48,
  weight: 79,
  history: "Buford 'Biff' Howard Tannen was born in 1937, to\
Irving Thomas 'Kid' Tannen and Myra Benson in Hill Valley,\
California. Kid and Myra got married on December 6, 1936",
  user_id: User.first.id
)

terminator = Movie.create!(
  image: 'https://static.wikia.nocookie.net/terminator/images/c/ca/Terminator_poster.jpg',
  title: 'The terminator',
  date: DateTime.civil(1984, 10, 26, 0, 0, 0, 0),
  qualification: 4,
  user_id: User.first.id
)

terminator.genres << Genre.find_by(name: 'action')
terminator.genres << Genre.find_by(name: 'terror')
terminator.genres << Genre.find_by(name: 'science fiction')
terminator.genres << Genre.find_by(name: 'thriller')
terminator.genres << Genre.find_by(name: 'adventure')
terminator.genres << Genre.find_by(name: 'fantasy')

terminator.characters.create!(
  image: 'https://static.wikia.nocookie.net/terminator/images/8/85/Trjs67656.jpg',
  name: 'T-800',
  age: 5,
  weight: 120,
  history: "T-800, is a type of Terminator mass-produced by\
Skynet. The T-800 Terminator was Skynet's first cybernetic\
organism, with living tissue over a hyperalloy\
 endoskeleton. This made it Skynet's first successful\
Infiltrator unit, capable of infiltrating the Resistance",
  user_id: User.first.id
)

terminator.characters.create!(
  image: 'https://static.wikia.nocookie.net/terminator/images/5/51/Sarah_T2_gun.jpg',
  name: 'Sarah Connor',
  age: 27,
  weight: 56,
  history: "Is a legendary figure and the mother of\
John Connor, the leader of the Resistance during the\
Future War, as well as teaching him in the ways of war.\
She was born and raised in Los Angeles, California",
  user_id: User.first.id
)

terminator.characters.create!(
  image: 'https://static.wikia.nocookie.net/terminator/images/9/99/MichaelEdwards004.jpg',
  name: 'John Connor',
  age: 44,
  weight: 80,
  history: "John Connor, the son of Sarah Connor and\
Kyle Reese, is the leader of the worldwide human\
Resistance, as well as the more specialised Tech-Com\
during the War Against the Machines. Skynet, the\
supercomputer mainframe of the machines, decides that\
John Connor is the focal point of the rebellion and\
his termination would end the opposition",
  user_id: User.first.id
)

robocop = Movie.create!(
  image: 'https://static.wikia.nocookie.net/robocop/images/8/8a/RoboCop_psotzer.jpg',
  title: 'Robocop',
  date: DateTime.civil(1987, 7, 17, 0, 0, 0, 0),
  qualification: 3,
  user_id: User.first.id
)

robocop.genres << Genre.find_by(name: 'action')
robocop.genres << Genre.find_by(name: 'science fiction')
robocop.genres << Genre.find_by(name: 'fantasy')
robocop.genres << Genre.find_by(name: 'adventure')
robocop.genres << Genre.find_by(name: 'thriller')
robocop.genres << Genre.find_by(name: 'crime')
robocop.genres << Genre.find_by(name: 'superheros')

robocop.characters.create!(
  image: 'https://static.wikia.nocookie.net/robocop/images/0/09/AlexMurphy.jpg',
  name: 'Alex James Murphy',
  age: 35,
  weight: 69,
  history: "was a dutiful, upstanding and mild-mannered\
Detroit Police Officer who was brutally killed in the\
line of duty by infamous crime boss Clarence Boddicker.\
Some of his organic components were later integrated\
into the cybernetic law enforcement entity:\
RoboCop - OCP Crime Prevention Unit 001, by the\
mega-corporation Omni Consumer Products",
  user_id: User.first.id
)

robocop.characters.create!(
  image: 'https://static.wikia.nocookie.net/robocop/images/d/dc/ClarenceBoddicker.jpg',
  name: 'Clarence Boddicker',
  age: 45,
  weight: 74,
  history: "Clarence J. Boddicker was a crime\
boss and leader of a gang who brutally murdered\
Officer Alex Murphy, who was rebuilt as RoboCop",
  user_id: User.first.id
)

robocop.characters.create!(
  image: 'https://static.wikia.nocookie.net/robocop/images/7/77/89.png',
  name: 'Anne Lewis',
  age: 28,
  weight: 59,
  history: "Was a Detroit Police Department officer\
at the Metro West precinct who was partnered with Alex\
Murphy at the time of his death. She was partnered with\
him again after his reconstruction as RoboCop and\
continued to patrol with him through multiple police\
strikes, often facing some of Detroit's most fearsome\
criminals with little or no backup",
  user_id: User.first.id
)

jl = Movie.create!(
  image: 'https://static.wikia.nocookie.net/dccu/images/0/03/Justice_League_theatrical_poster.png',
  title: 'Justice League',
  date: DateTime.civil(2017, 11, 17, 0, 0, 0, 0),
  qualification: 5,
  user_id: User.last.id
)

jl.genres << Genre.find_by(name: 'action')
jl.genres << Genre.find_by(name: 'fantasy')
jl.genres << Genre.find_by(name: 'superheros')
jl.genres << Genre.find_by(name: 'science fiction')
jl.genres << Genre.find_by(name: 'adventure')

jl.characters.create!(
  image: 'https://static.wikia.nocookie.net/dccu/images/2/2e/Batman_-_Justice_League_-_promo.jpg',
  name: 'Batman',
  age: 35,
  weight: 74,
  history: "Bruce Wayne is the CEO of Wayne Enterprises\
and the main vigilante operating in Gotham City,\
New Jersey known as the Batman. After witnessing the murder\
 of his parents at the hands of a mugger as a child, Bruce\
waged a war on crime in Gotham City for over 20 years\
before the Black Zero Event. He also serves as the leader\
of the Justice League which he co-founded alongside Wonder Woman",
  user_id: User.last.id
)

jl.characters.create!(
  image: 'https://static.wikia.nocookie.net/dccu/images/7/7b/606d5fdb287eda4d84921c698dd79938.jpg',
  name: 'Superman',
  age: 29,
  weight: 66,
  history: "Kal-El, legally named Clark Joseph Kent, is a\
superhero known as Superman, the last survivor of Krypton,\
the host of the Growth Codex, an investigative reporter for\
the Daily Planet, the fiancé of Lois Lane, and a member and\
direct inspiration of the Justice League.",
  user_id: User.last.id
)

jl.characters.create!(
  image: 'https://static.wikia.nocookie.net/dccu/images/6/6f/JL_Wonder_Woman.jpg',
  name: 'Wonder Woman',
  age: 25,
  weight: 57,
  history: "Diana of Themyscira is an Amazon warrior princess\
and one of the world's first superheroes, known as Wonder Woman.\
She is the daughter of Queen Hippolyta and Zeus, the king of\
the Old Gods, as well as a member and co-founder of the Justice League. ",
  user_id: User.last.id
)

ryan = Movie.create!(
  image: 'https://static.wikia.nocookie.net/savingprivateryan/images/8/8c/Sprposter.jpg',
  title: 'Saving private ryan',
  date: DateTime.civil(1998, 7, 21, 0, 0, 0, 0),
  qualification: 3,
  user_id: User.last.id
)

ryan.genres << Genre.find_by(name: 'war')
ryan.genres << Genre.find_by(name: 'action')
ryan.genres << Genre.find_by(name: 'drama')

ryan.characters.create!(
  image: 'https://static.wikia.nocookie.net/savingprivateryan/images/9/95/Miller.jpg',
  name: 'John Miller',
  age: 33,
  weight: 62,
  history: "Captain John H. Miller was a thirty four-year-old American\
serving in the 2nd Rangers Battalion of the United States Army during\
World War Two, holding the rank of Captain and the protagonist of the\
film Saving Private Ryan. He was portrayed by actor Tom Hanks",
  user_id: User.last.id
)

ryan.characters.create!(
  image: 'https://static.wikia.nocookie.net/savingprivateryan/images/2/2a/Reiben.jpg',
  name: 'Richard Reiben ',
  age: 29,
  weight: 60,
  history: "Private First Class Richard Reiben was a supporting\
character in the film, Saving Private Ryan. He was an American\
soldier serving in the 2nd Rangers Battalion of the United States Army\
 and held the rank of Private. He was from Brooklyn, New York City, as\
shown written proudly on the back of his jacket. While in service, he\
smoked cigars instead of the standard cigarettes usually given to infantrymen",
  user_id: User.last.id
)

ryan.characters.create!(
  image: 'https://static.wikia.nocookie.net/savingprivateryan/images/a/a7/James_Ryan.jpg',
  name: 'James Francis Ryan',
  age: 27,
  weight: 66,
  history: "Private First Class James Francis Ryan is an American soldier\
who served for the 101st Airborne Division in Baker Company, 1st Battalion\
506th PIR during World War Two. He was the youngest sibling of the Ryan family.\
His older brothers were Daniel Ryan, Peter Ryan and Sean Ryan and his mother was\
Margaret Ryan. He has a wife known as Mrs. Ryan. He serves as the titular and\
pivotal character of the film, Saving Private Ryan.",
  user_id: User.last.id
)

rocky = Movie.create!(
  image: 'https://static.wikia.nocookie.net/rocky/images/1/18/Rocky_poster.jpg',
  title: 'Rocky',
  date: DateTime.civil(1976, 12, 3, 0, 0, 0, 0),
  qualification: 3,
  user_id: User.last.id
)

rocky.genres << Genre.find_by(name: 'action')
rocky.genres << Genre.find_by(name: 'romantic')
rocky.genres << Genre.find_by(name: 'sports')
rocky.genres << Genre.find_by(name: 'adventure')
rocky.genres << Genre.find_by(name: 'drama')

rocky.characters.create!(
  image: 'https://static.wikia.nocookie.net/rocky/images/f/f9/BalboaTitle1982.jpg',
  name: 'Rocky Balboa',
  age: 76,
  weight: 58,
  history: "Robert Rocky Balboa, Sr. is an American\
retired heavyweight boxer and former Two-Time Heavyweight Champion. He is\
famous for his indomitable spirit, extreme tenacity and ferocious body attack.",
  user_id: User.last.id
)

rocky.characters.create!(
  image: 'https://static.wikia.nocookie.net/rocky/images/b/b3/Apollo-creed-profile.jpg',
  name: 'Apollo Creed',
  age: 43,
  weight: 62,
  history: "Creed is presented as the undisputed heavyweight world champion in Rocky,\
he was undefeated and had cleared out his division of challengers prior\
to his fight with Rocky Balboa, ",
  user_id: User.last.id
)

rocky.characters.create!(
  image: 'https://static.wikia.nocookie.net/rocky/images/5/54/Micky.png',
  name: 'Mickey Goldmill ',
  age: 76,
  weight: 62,
  history: "Michael Mickey Goldmill was the owner of Mighty Mick's Boxing\
and head Trainer of Rocky Balboa for most of Balboa's career. Goldmill\
is most likely based on legendary boxing trainer Cus D'amato",
  user_id: User.last.id
)

exorcist = Movie.create!(
  image: 'https://static.wikia.nocookie.net/horrormovies/images/3/36/The_Exorcist.jpg',
  title: 'The exorcist',
  date: DateTime.civil(1973, 12, 26, 0, 0, 0, 0),
  qualification: 4,
  user_id: User.last.id
)

exorcist.genres << Genre.find_by(name: 'terror')
exorcist.genres << Genre.find_by(name: 'suspense')
exorcist.genres << Genre.find_by(name: 'supernatural')

exorcist.characters.create!(
  image: 'https://static.wikia.nocookie.net/horrormovies/images/c/c1/Exorcist_Regan.jpg',
  name: 'Regan Teresa MacNeil',
  age: 12,
  weight: 48,
  history: "She was one of Pazuzu's most important possession victims.\
He first came to her, when she was 12 years-old, after she had dabbled\
with a Ouija Board. Regan was possessed by Pazuzu twice",
  user_id: User.last.id
)

exorcist.characters.create!(
  image: 'https://static.wikia.nocookie.net/horrormovies/images/a/aa/Screenshot_2020-08-06_father_merrin_-_Google_Search.png',
  name: 'Lankester Merrin',
  age: 79,
  weight: 50,
  history: "He is a priest, but he is also an archaeologist and an\
exorcist, that exorcised before. He is recruited by the church to\
exorcise Regan with the help of Karras, another priest",
  user_id: User.last.id
)

exorcist.characters.create!(
  image: 'https://static.wikia.nocookie.net/horrormovies/images/1/14/Pazuzu.jpg',
  name: 'Pazuzu',
  age: 500,
  weight: 67,
  history: "Pazuzu is depicted as being a very high-tier demon that\
serves as king of the demons of the wind. To attack his enemies,\
Pazuzu typically employs not only physical pain but also psychological\
attacks crafted from Pazuzu's reading of the victim's past",
  user_id: User.last.id
)

usoldier = Movie.create!(
  image: 'https://static.wikia.nocookie.net/universalsoldier/images/6/62/Universal_soldier_poster.jpeg',
  title: 'Universal Soldier',
  date: DateTime.civil(1992, 7, 10, 0, 0, 0, 0),
  qualification: 5,
  user_id: User.last.id
)

usoldier.genres << Genre.find_by(name: 'action')
usoldier.genres << Genre.find_by(name: 'adventure')
usoldier.genres << Genre.find_by(name: 'martial arts')
usoldier.genres << Genre.find_by(name: 'science fiction')
usoldier.genres << Genre.find_by(name: 'drama')
usoldier.genres << Genre.find_by(name: 'thriller')

usoldier.characters.create!(
  image: 'https://static.wikia.nocookie.net/universalsoldier/images/0/09/Luc_Deveraux1.jpg',
  name: 'Luc Deveraux',
  age: 29,
  weight: 63,
  history: " Luc becomes a UniSol after being reanimated in a secret government\
project along with other previously dead soldiers.",
  user_id: User.last.id
)

usoldier.characters.create!(
  image: 'https://static.wikia.nocookie.net/universalsoldier/images/e/ed/Andrew_scott.png',
  name: 'Andrew Scott ',
  age: 27,
  weight: 60,
  history: "When the army finds the aftermath of the Scott massacre his body is\
packed in ice and sent off for a secret project. His inciden is covered up and\
word is sent home that Scott is missing in action. What used to be Sgt.\
Andrew Scott has become GR-13 of the Universal Soldier program",
  user_id: User.last.id
)

usoldier.characters.create!(
  image: 'https://static.wikia.nocookie.net/universalsoldier/images/1/15/2.jpg',
  name: 'Veronica Roberts',
  age: 24,
  weight: 55,
  history: "The character was featured as a TV Journalist that later\
assisted in helping Luc Deveraux avoid capture by a private division\
of the government that were creating super-soldiers called, UniSols\
or simply Universal Soldiers.She would also help him in his journey\
to return home while evading his superior Sgt. Andrew Scott",
  user_id: User.last.id
)
