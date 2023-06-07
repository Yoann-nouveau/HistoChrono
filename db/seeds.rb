# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([ name: "Star Wars" },  name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Period.destroy_all
User.destroy_all

french_revolution = Period.create!(
  name: "La Révolution Française",
  start_date: Date.new(1789, 5, 5),
  end_date: Date.new(1799, 9, 5)
)

puts "period valide"

basile = User.create!(
  email: "basile@mail.com",
  password: "azerty",
  fullname: "Basile de Beaulieu",
  nickname: "Bazi"
)
puts "user valide"

Monument.create!(
  name: "La Bastille",
  address: "Paris",
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
  period_id: french_revolution.id,
  user_id: basile.id
)
puts "monument valide"

Personality.create!(
  fullname: "Napoléon Bonaparte",
  birth_day: 15,
  birth_month: 8,
  birth_year: 1769,
  death_day: 5,
  death_month: 5,
  death_year: 1821,
  description: "Napoléon Bonaparte, né le 15 août 1769 à Ajaccio
  et mort le 5 mai 1821 sur l'île de Sainte-Hélène, est un
  militaire et homme d'État français, premier empereur des
  Français du 18 mai 1804 au 6 avril 1814 et du 20 mars au
  22 juin 1815, sous le nom de Napoléon Ier.",
  wikipedia_url: "https://fr.wikipedia.org/wiki/Napol%C3%A9on_Ier",
  period_id: french_revolution.id,
  progess: 0.0,
  user_id: basile.id
)
puts "personality valide"

Event.create!(
  name: "Prise de la Bastille",
  start_day: 14,
  start_month: 7,
  start_year: 1789,
  end_day: 14,
  end_month: 7,
  end_year: 1789,
  address: 'La Bastille - Paris',
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
  period_id: french_revolution.id,
  user_id: basile.id
)

puts "event valide"
puts "seeds finished !"
