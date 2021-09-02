require 'open-uri'
require 'json'
require 'nokogiri'
require 'faker'

Review.destroy_all
Participant.destroy_all
Meetup.destroy_all
Bookmark.destroy_all
OfferCategory.destroy_all
Category.destroy_all
Offer.destroy_all
User.destroy_all


########################
# Users
puts "
Creating a lot of User"
user_1 = User.new(email: 'anna.bozio@gmail.com', nickname: "anietchka", password: '123456', first_name: 'Anna', last_name: 'Bozio')
user_2 = User.create!(email: 'migatsar@gmail.com', nickname: "migasar", password: '123456', first_name: 'Mickael', last_name: 'Gaspar')
user_3 = User.create!(email: 'estelle.cirilo@gmail.com', nickname: "ecirilo1", password: '123456', first_name: 'Estelle', last_name: 'Cirilo')
user_4 = User.create!(email: 'barois.anne@orange.fr', nickname: "oslanne", password: '123456', first_name: 'Anne', last_name: 'Barois')
user_5 = User.create!(email: 'ville-de-paris@gmail.com', nickname: "VilleDeParis", password: '123456', first_name: 'Ville', last_name: 'de Paris')

file = URI.open('https://i.skyrock.net/4416/47814416/pics/1946552767_small_1.jpg')
user_1.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
user_1.save!

########################
# Fake users
puts 'Creating 50 fake users...'
50.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    nickname: Faker::Internet.unique.username,
    email: Faker::Internet.email(name: "#{:first_name} #{:last_name}", separators: '_'),
    password: Faker::Internet.password(min_length: 8)
  )
  user.save!
end
puts 'Users Created!'

########################
########################


########################
# Offers
puts "
Creating a lot of Offers"
offer_demoday = Offer.new(name: "Changez de vie, vos enfants apprennent à coder", theme: "interieure", address: "16 villa Gaudelet, 75011 Paris", url:"https://www.lewagon.com", start_date:"2021-08-30", end_date: "2021-09-03", permanent: false, description: "Vous ne savez pas quoi faire de vos enfants avant la rentrée ? Notre super équipe composée de <strong>Thanh</strong>, <strong>Dimitri</strong>, <strong>Julien</strong> et <strong>Germain</strong> seront ravis de vous les garder pour leur apprendre à coder! Grâce à ces professeurs hors du communs, vos enfants seront incollable en HTML, CSS et seront capable de pirater votre ordinateur en quelques minutes.<br>
Au programme :<br>
<ul><li>dégustation quotidienne d'empanadas</li>
<li>grand jeux de code and drink avec des bières sans alcool 500% bio fabriquée dans la cave du Wagon par <strong>Lamiaa</strong></li>
<li>olympiades de corde a sauter au dessus d'un ravin (sécurité assurée par <strong>Jeremy</strong>)</li>
</ul><br>
Cet événement est entièrement accessible aux publics sourds et malentendants, grâce à la présence d’<strong>Édouard</strong>, interprète Langue des signes française / français ", min_age: 6, photo: "https://www.makeblock.com/wp-content/uploads/2019/05/Coding-for-kids-through-playing-300x200.jpg", user: User.all.sample)
offer_demoday.save!
category = Category.create(name: "Animations")
OfferCategory.create(offer: offer_demoday, category: category)
Review.create(offer: offer_demoday, user: User.all.sample, rating: 2, comment: "Activité sympatique pour mon fils malgré le fait que Thomas l'ai fait pleuré pour le choix de la couleur jaune")
Review.create(offer: offer_demoday, user: User.all.sample, rating: 5, comment: "Depuis qu'elle a rencontré Romain, ma fille ne me parle plus que de Stimulus!")
Review.create(offer: offer_demoday, user: User.all.sample, rating: 5, comment: "Mes enfants ont adoré les designs paillettes licornes de Diane")


old_static_records = [
  # Offer.create!(name: "Expo Harry Potter - Retour à Poudlard", theme: "interieure", address: "Rue du 8 Mai 1945, 75010 Paris" ,url: "https://www.facebook.com/events/521401079177879/",start_date: "2021-08-07" ,end_date: "2021-08-30", permanent: false, description: "Tous les ans, le 1er septembre signifie 'fin des vacances' pour les enfants. Mais pour les fans d'Harry Potter, c'est surtout le rendez-vous incontournable de la saga : le \"Retour à Poudlard\" !
  # En préambule, une exposition est organisée tout l'été dans les gares. Du 7 juillet au 30 août, l'expo Harry Potter des illustrations signées Jim Kay est en effet accessibles à Paris Gare de Lyon, Nice, Bordeaux, Poitiers et Limoges. Petits et grands retrouvent les magnifiques dessins des trois premiers tomes de la saga.
  # Le week-end des 28 et 29 août 2021, le 'Retour à Poudlard' prévoit un beau programme ! Le Pouldard Express grandeur nature, un pop-up store animé par la FNAC de 10h à 19h, un photocall de la voie 9 ¾... Rendez-vous sur le parvis de la gare Saint-Lazare pour en profiter.
  # Du 28 août au 10 octobre, une autre exposition Harry Potter est prévue, cette fois autour des illustrations des studios Minalima sur le premier tome (déjà disponible) et sur le second tome (à paraître à l'automne).
  # À partir du 28 août également, l'expérience Harry Potter en réalité augmentée réalise le rêve des jeunes fans : passer la voie 9 ¾ ! Ce lieu mythique de la station King's Cross de Londres est à retrouver en avant-première dans les 31 gares partenaires et tous les magasins FNAC via un QR code, puis dans les smartphones le 1er septembre via les comptes Facebook @harrypotterfilms et Instagram @warnerbrosfr.
  # Parmi les gares partenaires, on retrouve : Aix-en-Provence TGV, Amiens, Besançon Viotte, Bordeaux Saint-Jean, Clermont-Ferrand, Dijon Ville, Grenoble, Le Havre, Lille Europe, Lille Flandres, Limoges Bénédictin, Lyon Part Dieu, Marseille Saint-Charles, Metz, Montpellier Saint-Roch, Nancy, Nantes, Nice Ville, Paris Gare d’Austerlitz, Paris Gare de l’Est, Paris Gare de Lyon, Paris Gare du Nord, Paris Gare Montparnasse, Paris Saint-Lazare, Poitiers, Reims, Rennes, Rouen, Strasbourg, Toulouse Matabiau, Tours.
  # Un événement en collaboration entre les gares SCNF, Gallimard Jeunesse, Warner Bros et la FNAC.", min_age: 6, max_age: 12, user: User.all.sample, photo:"https://www.citizenkid.com/uploads/medias/cache/post_cover/rc/jTPZVgwU//uploads/medias/04/b4/04b4d2d8ea89b70d28b656afb1f050aa7287c9c8.jpeg")
  # Offer.create!(name: "La Princesse au petit pois dans la tête", theme: "interieure", address: "Théâtre Le Bout
  # 6 rue Frochot
  # 75009 Paris", url: "https://lebout.com/", start_date: "2021-06-16", end_date: "2021-08-30", permanent: false, description: "La Princesse n'est pas au bout de ses peines. L'ogre prépare un grand festin et s'apprête à capturer le plus d'enfants possible.
  # Le roi s'enfuit pour demander de l'aide et laisse le royaume aux mainx de la jeune fille, pas très futée.
  # Heureusement, le jeune dentiste du château vient à son secours. Un véritable chevalier celui-là !
  # Aventure, quiproquos, péripéties... Petits et grands ne vont pas s'ennuyer !
  # Pour la 16e année consécutive, le spectacle séduit toute la famille. L'aventure continue...", min_age: 3, user: User.all.sample, photo: "https://www.citizenkid.com/uploads/medias/cache/post_cover/rc/GZnh57D5//uploads/medias/bb/2f/bb2f578d9a767090b4c003bb34908b203eeba582.jpeg")
  # Offer.create!(name: "La Cité des enfants", theme: "interieure", address: "30 avenue Corentin Cariou 75019 Paris, France", url: "https://www.cite-sciences.fr/fr/au-programme/expos-permanentes/la-cite-des-enfants/cite-des-enfants-2-7-ans/", permanent: true, description: "La Cité des enfants 2-7 ans est ouverte à la petite enfance dès 2 ans, et s’organise sur 1700 m² découpés en cinq espaces thématiques : Je me découvre, Je sais faire, Je me repère, J’expérimente, Tous ensemble.
  # Les trois premiers thèmes sont centrés sur le développement de l’enfant et ses facultés corporelles, cognitives, spatiales. Les deux suivants proposent une ouverture au monde et aux autres.
  # Pour aider les adultes à trouver leur place dans cet espace, des pictogrammes suggèrent de jouer avec son enfant, de l’encourager, ou de simplement l’observer.
  # Une attention particulière a été portée au public handicapé et de nombreuses activités sont accessibles à tous les handicaps. Les accompagnateurs handicapés ont aussi été pris en compte : des textes en braille sont notamment accessibles aux parents non-voyants.
  # Pour aider les adultes à trouver leur place dans cet espace, des pictogrammes suggèrent de jouer avec son enfant, de l’encourager, ou de simplement l’observer.
  # Une attention particulière a été portée au public handicapé et de nombreuses activités sont accessibles à tous les handicaps. Les accompagnateurs handicapés ont aussi été pris en compte : des textes en braille sont notamment accessibles aux parents non-voyants.", min_age: 2, max_age: 7, schedule: "mardi	09:30–18:00
  # mercredi	09:30–18:00
  # jeudi	09:30–18:00
  # vendredi	09:30–18:00
  # samedi	09:30–18:00
  # dimanche	09:30–19:00
  # lundi	Fermé", user: User.all.sample, photo: "https://www.cite-sciences.fr/fileadmin/_migrated/pics/Ens-Cite-votre-visite-CDE.jpg")
  #Offer.create!(name: "jardin du luxembourg", address: "jardin du luxembourg, 75006 Paris", permanent: true, description: "Le jardin du Luxembourg est un jardin ouvert au public, situé dans le 6ᵉ arrondissement de Paris.", min_age: 0, schedule: "https://www.senat.fr/visite/jardin/horaires.html", user: User.all.sample, photo: "https://www.cityzeum.com/images/lieu/bigstock-paris-park-27564803.jpg")
  # Offer.create!(name: "Ferme de Paris", theme: "exterieure", address: "Route du Pesage  75012  Paris 12e ", url: "https://www.paris.fr/equipements/la-ferme-de-paris-6597", permanent: true, description: "La Ferme de Paris, de son ancien nom Ferme Georges Ville, est une ferme pédagogique et environnementale située dans le bois de Vincennes, à côté de l'hippodrome de Vincennes dans le 12ᵉ arrondissement de Paris.", min_age: 0, schedule: "Ouvert tous les samedis et dimanches à partir de 13h30
  #   Ouvert du mardi au vendredi pendant les vacances de printemps (zone C) et les vacances d’été à partir de 13h30
  #   Fermeture les jours fériés", user: User.all.sample, photo: "https://www.leparisien.fr/resizer/v6sPqBZ6nFkxqUdAh3vxCnqRkR0=/932x582/arc-anglerfish-eu-central-1-prod-leparisien.s3.amazonaws.com/public/KESMU7KLVCW7PLJ4L6OWXCWUXU.jpg")
  # #Offer.create!(name: , address: , url: , start_date: , end_date: , permanent: , description: , min_age: , max_age: , schedule: , user: User.all.sample, photo:)
]

########################
# API call to fetch records for Squares of Paris
endpoint = 'https://opendata.paris.fr/api/records/1.0/search/?dataset=espaces_verts&q=&rows=100&facet=type_ev&facet=categorie&facet=adresse_codepostal&facet=presence_cloture&facet=ouvert_ferme&exclude.categorie=Talus&exclude.categorie=Arboretum&exclude.categorie=Archipel&exclude.categorie=Cimeti%C3%A8re&exclude.categorie=Decoration&exclude.categorie=Jardin+d%27immeubles&exclude.categorie=Jardin+partage&exclude.categorie=Jardiniere&exclude.categorie=Mail&exclude.categorie=Murs+vegetalises&exclude.categorie=Plate-bande&exclude.categorie=Terre-plein&exclude.categorie=Jardinet&exclude.categorie=Ile&exclude.categorie=Promenade&exclude.categorie=Pelouse'
data = JSON.parse(URI.open(endpoint).read)

data['records'].each do |record|
  # Adress field
  address = "#{record['fields']['adresse_numero']}, #{record['fields']['adresse_typevoie']} #{record['fields']['adresse_libellevoie']} #{record['fields']['adresse_codepostal']}"

  old_unused_fields_code = [
    # url_search = "https://www.google.com/search?q=#{record['fields']['nom_ev'].gsub(" ","+")}"
    # html_file = URI.open(url_search).read
    # html_doc = Nokogiri::HTML(html_file)
    # html_doc.at('.zloOqf').text
  ]

  # Offer record
  offer = Offer.new(
    name: record['fields']['nom_ev'],
    address: address,
    permanent: true,
    # description: ,
    min_age: 0,
    # schedule: ,
    photo: "https://www.flaticon.com/fr/auteurs/freepik",
    theme: "exterieure",
    user: User.find_by(email: 'ville-de-paris@gmail.com')
  )
  if record['fields']['categorie'] == "Parc" || record['fields']['categorie'] == "Jardin" || record['fields']['categorie'] == "Pelouse"
    offer.photo = "https://image.freepik.com/vecteurs-libre/parc-ville-arbres-verts-herbe-banc-bois-lanternes-batiments-ville-toits_107791-5378.jpg"
  elsif record['fields']['categorie'] == "Bois"
    offer.photo = "https://image.freepik.com/vecteurs-libre/fond-foret-dessin-anime-paysage-parc-naturel_107791-2040.jpg"
  elsif record['fields']['categorie'] == "Square"
    offer.photo = "https://image.freepik.com/vecteurs-libre/aire-jeux-pour-enfants-dans-parc-ete-carrousel_107791-1361.jpg"
  elsif record['fields']['categorie'] == "Petanque"
    offer.photo = "https://www.sortiraparis.com/images/1001/40234/196532-ou-jouer-a-la-petanque-a-paris.jpg"
  end
  offer.save!
  puts "Offer #{offer.name} created! youhou"

  # Category record
  category = Category.find_by(name: record['fields']['categorie'])
  unless category
    category = Category.create(name: record['fields']['categorie'])
  end

  OfferCategory.create(offer: offer, category: category)
end

########################
# API call to fetch records for Cultural Events in Paris
url_sortir_a_paris = "https://opendata.paris.fr/api/records/1.0/search/?dataset=que-faire-a-paris-&q=&rows=400&facet=category&facet=tags&facet=address_name&facet=address_zipcode&facet=address_city&facet=pmr&facet=price_type&refine.tags=Enfants"
data = JSON.parse(URI.open(url_sortir_a_paris).read)

data['records'].each do |record|

  # Adress field
  address = "#{record['fields']['address_street']}, #{record['fields']['address_city']}"

  if !record['fields']['title'].nil?

    # Offer record
    offer = Offer.new(
      name: record['fields']['title'],
      address: address,
      url: record['fields']['contact_url'],
      start_date: record['fields']['date_start'],
      end_date: record['fields']['date_end'],
      permanent: false,
      description: record['fields']['description'],
      #schedule: ,
      photo: record['fields']['cover_url'],
      theme: "interieure",
      user: User.find_by(email: 'ville-de-paris@gmail.com')
      )

      # Offer extra fields
      if !record['fields']['description'].nil? && record['fields']['description'].scan(/(partir de \d+ ans)/).first
        offer.min_age = record['fields']['description'].scan(/(partir de \d+ ans)/).first.first.scan(/(\d+)/).first.first.to_i
      elsif !record['fields']['description'].nil? && record['fields']['description'].scan(/(moins de \d+ ans)/).first
        offer.max_age = record['fields']['description'].scan(/(moins de \d+ ans)/).first.first.scan(/(\d+)/).first.first.to_i
      elsif !record['fields']['tags'].nil? && record['fields']['tags'].scan(/Plein air/i).first
        offer.theme = "exterieure"
      end
      offer.save!
      puts "Offer #{offer.name} created! youhou"

      # Category record
      if !record['fields']['category'].nil?
        category = Category.find_by(name: record['fields']['category'].split(" ").first)
      unless category
        category = Category.create(name: record['fields']['category'].split(" ").first)
      end
    end

    OfferCategory.create(offer: offer, category: category)
  end
end

old_unused_scraping_code = [
  # url_ile_de_france = "https://data.iledefrance.fr/api/records/1.0/search/?dataset=evenements-publics-cibul&q=&rows=200&facet=tags&facet=placename&facet=department&facet=region&facet=city&facet=date_start&facet=date_end&facet=pricing_info&facet=updated_at&facet=city_district&refine.tags=jeune+public&refine.tags=enfant&refine.tags=enfants&refine.tags=Jeune+public&refine.tags=spectacle+pour+enfants&refine.tags=danse&exclude.date_end=2020&exclude.date_end=2019&exclude.date_end=2018&exclude.date_end=2017&exclude.date_end=2016&exclude.date_end=2015&exclude.date_end=2014&exclude.date_end=2013&exclude.date_end=2021-08&exclude.date_end=2021-02&exclude.date_end=2021-03&exclude.date_end=2021-04&exclude.date_end=2021-05&exclude.date_end=2021-06&exclude.date_end=2021-07&exclude.date_end=2012&exclude.date_end=2011&exclude.date_start=2021-01"
  # data = JSON.parse(URI.open(url_ile_de_france).read)
  # data['records'].each do |record|
  #   url_search = record['fields']['link']
  #   html_file = URI.open(url_search).read
  #   html_doc = Nokogiri::HTML(html_file)
  #   html_doc.at('.detail-item-content').text
  #   offer = Offer.new(
  #     name: record['fields']['title'],
  #     address: record['fields']['address'],
  #     start_date: record['fields']['date_start'],
  #     end_date: record['fields']['date_end'],
  #     permanent: false,
  #     description: record['fields']['free_text']
  #   )
  #   offer.save
  # end
]
puts 'Offers Created!'

########################
########################


########################
# Meetups
puts "
Creating 300 Meetups and their Particpants"

300.times do

  offer = Offer.all.sample

  # Meetup Date
  if offer.permanent == false
    meetup_date = rand(offer.start_date..offer.end_date) + rand(10..18).hours
  else
    meetup_date = rand(Date.today..(Date.today + 1.month)) + rand(10..18).hours
  end

  # Create Meetup
  meetup = Meetup.find_or_create_by!(
    user: User.last(50).sample,
    offer: offer,
    date: meetup_date,
    description: Faker::Lorem.sentence
  )

  # Create Particpants to the Meetup
  users_sample = User.last(50).sample(rand(1..7))

  users_sample.each do |user|
    participant = Participant.find_or_create_by!(
      user: user,
      meetup: meetup
    )
  end
end
puts 'Meetups and Participants Created!'

puts "
########
DB Seed Completed!

"
