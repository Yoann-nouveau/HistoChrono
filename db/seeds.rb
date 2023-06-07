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
  end_date: Date.new(1799, 9, 5),
  polygons: {
    "type": "FeatureCollection",
    "features": [
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "coordinates": [
            [
              [
                -4.819882811539827,
                48.36026787098393
              ],
              [
                -4.7734952350189985,
                48.11009609201267
              ],
              [
                -4.393549486723572,
                47.90166749752757
              ],
              [
                -3.8205748494952445,
                47.95691067577408
              ],
              [
                -2.333184518072869,
                47.51775572705753
              ],
              [
                -2.028428065775927,
                47.02974639599961
              ],
              [
                -1.9950390671980927,
                46.67073845878227
              ],
              [
                -1.0759606471026757,
                46.195802631062236
              ],
              [
                -1.2002093057845684,
                45.65196266586071
              ],
              [
                -0.5597014678570247,
                45.00008503673581
              ],
              [
                -1.109699490659608,
                45.414761440010835
              ],
              [
                -1.2449194054866553,
                44.647466771955465
              ],
              [
                -1.283296105847569,
                43.82108384448526
              ],
              [
                -1.7986304667300317,
                43.34936312991027
              ],
              [
                -1.376344619127991,
                43.05179954787852
              ],
              [
                -0.5722773329765118,
                42.782524076500636
              ],
              [
                0.26148732410902653,
                42.654176926086876
              ],
              [
                0.7512058402826369,
                42.81839499070375
              ],
              [
                1.5750789900967561,
                42.63071488888906
              ],
              [
                2.5865830410910746,
                42.48471963227041
              ],
              [
                3.1137799739830143,
                42.481444877722396
              ],
              [
                2.92540159725462,
                42.94432462242918
              ],
              [
                3.5899391247019423,
                43.508206395212284
              ],
              [
                4.906729905429501,
                43.4275254378347
              ],
              [
                4.970372690136429,
                44.39719591913075
              ],
              [
                4.4569347607154555,
                45.303281662163386
              ],
              [
                5.439371145040724,
                46.55613241913926
              ],
              [
                7.205254806735439,
                47.30619308975221
              ],
              [
                7.270417680832821,
                48.2839260610873
              ],
              [
                6.535546115480287,
                48.66526304228901
              ],
              [
                4.318180739150591,
                48.9027835529655
              ],
              [
                3.72084361452994,
                49.567871634234166
              ],
              [
                3.875838250610542,
                50.407484284096086
              ],
              [
                4.360721202886879,
                51.40960249879748
              ],
              [
                3.7816579449867618,
                51.34506228205416
              ],
              [
                1.707858599117742,
                50.90598115739874
              ],
              [
                1.652004897216898,
                50.597195965948686
              ],
              [
                1.6209513310495254,
                50.15591309730584
              ],
              [
                0.905410014937786,
                49.91067709058598
              ],
              [
                0.1453782616549404,
                49.57283124583424
              ],
              [
                0.345818190171002,
                49.402087193266965
              ],
              [
                -0.1390722510323883,
                49.3129142301961
              ],
              [
                -1.1787530503076482,
                49.429880965067184
              ],
              [
                -1.300228279105852,
                49.56869440343675
              ],
              [
                -1.2953048540320822,
                49.71012902877487
              ],
              [
                -1.6431659597875523,
                49.688081150860114
              ],
              [
                -1.926818318811229,
                49.73167356457401
              ],
              [
                -1.5858088012707015,
                49.130068965655965
              ],
              [
                -1.4286360578554138,
                48.66111814805933
              ],
              [
                -1.7157993097181645,
                48.63494395766929
              ],
              [
                -1.848894758724441,
                48.691146239806415
              ],
              [
                -2.313627016154726,
                48.66420880279438
              ],
              [
                -2.6374395262203336,
                48.49800195699123
              ],
              [
                -2.8330523161115195,
                48.62730567943365
              ],
              [
                -3.156061975358739,
                48.8930574177036
              ],
              [
                -3.515142424497668,
                48.72645495158241
              ],
              [
                -3.7104042731259597,
                48.73741786551591
              ],
              [
                -3.9158821485705175,
                48.65487869776405
              ],
              [
                -4.142384677136505,
                48.71372332053025
              ],
              [
                -4.511455774313333,
                48.60339427541891
              ],
              [
                -4.785584961521835,
                48.54615281236528
              ],
              [
                -4.819882811539827,
                48.36026787098393
              ]
            ]
          ],
          "type": "Polygon"
        }
      }
    ]
  }
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
