# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([ name: "Star Wars" },  name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Period.destroy_all
User.destroy_all
Monument.destroy_all
Personality.destroy_all
Event.destroy_all

Period.create!(
  name: "La Révolution Française",
  start_date: Date.new(1789, 5, 5),
  end_date: Date.new(1799, 9, 5)
)

puts "period valide"

User.create!(
  email: "basile@mail.com",
  password: "azerty",
  fullname: "Basile de Beaulieu",
  nickname: "Bazi"
)
puts "user valide"

Monument.create!(
  name: "La Bastille",
  location: "Paris",
  description: "La bastille Saint-Antoine, souvent appelée
  simplement la Bastille et anciennement fort et bastide
  Saint-Anthoine lez Paris1,2, est une forteresse construite
  au xive siècle, à l'emplacement du débouché de la rue
  Saint-Antoine sur l’actuelle place de la Bastille à Paris.
  Devenue une prison, considérée comme le symbole du despotisme
  monarchique, elle fut totalement détruite lors de la Révolution
  française, après l'événement déclencheur devenu une
  fête nationale en France : la prise de la Bastille du 14
  juillet 1789.",
  wikipedia_url: "https://fr.wikipedia.org/wiki/Bastille",
  google_earth_url: "https://earth.google.com/web/search/la+bastille+paris/@48.85324435,2.36939165,37.65972245a,319.63561261d,35y,0h,45t,0r/data=CnwaUhJMCiUweDQ3ZTY3MjAxYWNhOTkyMjk6MHgyMzFlYjBjOTY3ZTVlYjEwGZ0lbU81bUhAIdwMN-Dz8wJAKhFsYSBiYXN0aWxsZSBwYXJpcxgCIAEiJgokCaK61faIvTNAEaK61faIvTPAGfjCsggcUkFAISzUwZX7lVDAKAI",
  progess: 0.0,
  latitude: 48.5112,
  longitude: 2.2209,
  period_id: 1,
  user_id: 1
)
puts "monument valide"

Personality.create!(
  fullname: "Napoléon Bonaparte",
  birthdate: Date.new(1769, 8, 15),
  deathdate: Date.new(1821, 5, 5),
  description: "Napoléon Bonaparte, né le 15 août 1769 à Ajaccio
  et mort le 5 mai 1821 sur l'île de Sainte-Hélène, est un
  militaire et homme d'État français, premier empereur des
  Français du 18 mai 1804 au 6 avril 1814 et du 20 mars au
  22 juin 1815, sous le nom de Napoléon Ier.",
  wikipedia_url: "https://fr.wikipedia.org/wiki/Napol%C3%A9on_Ier",
  period_id: 1,
  progess: 0.0,
  user_id: 1
)
puts "personality valide"

Event.create!(
  name: "Prise de la Bastille",
  start_date: DateTime.new(1789, 7, 14),
  end_date: DateTime.new(1789, 7, 14),
  location: 'La Bastille - Paris',
  description: "La prise de la Bastille, survenue le mardi 14 juillet 1789
  à Paris, est l'un des événements inauguraux et emblématiques de la
  Révolution française. Cette journée, durant laquelle la Bastille est
  prise d'assaut par des émeutiers est, dans la tradition
  historiographique, considérée comme la première intervention
  d'ampleur du peuple parisien dans le cours de la Révolution et dans
  la vie politique française.",
  wikipedia_url: "https://fr.wikipedia.org/wiki/Prise_de_la_Bastille",
  youtube_url: "https://www.youtube.com/results?search_query=prise+de+la+bastille",
  progess: 0.0,
  latitude: 48.5111,
  longitude: 2.2209,
  period_id: 1,
  user_id: 1
)

puts "event valide"
puts "seeds finished !"
