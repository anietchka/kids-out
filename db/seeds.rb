# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Offer.destroy_all
User.destroy_all

puts 'Creating a lot of User'
User.create!(email: 'anna.bozio@gmail.com', password: '123456', first_name: 'Anna', last_name: 'Bozio')
User.create!(email: 'migatsar@gmail.com', password: '123456', first_name: 'Mica', last_name: 'Gaspar')
User.create!(email: 'estelle.cirilo@gmail.com', password: '123456', first_name: 'Estelle', last_name: 'Cirilo')
User.create!(email: 'barois.anne@orange.fr', password: '123456', first_name: 'Anne', last_name: 'Barois')
puts 'Users Created!'

Offer.create!(name: "Expo Harry Potter - Retour à Poudlard",address: "Rue du 8 Mai 1945, 75010 Paris" ,url: "https://www.facebook.com/events/521401079177879/",start_date: "2021-08-07" ,end_date: "2021-08-30", permanent: false, description: "Tous les ans, le 1er septembre signifie 'fin des vacances' pour les enfants. Mais pour les fans d'Harry Potter, c'est surtout le rendez-vous incontournable de la saga : le \"Retour à Poudlard\" !

En préambule, une exposition est organisée tout l'été dans les gares. Du 7 juillet au 30 août, l'expo Harry Potter des illustrations signées Jim Kay est en effet accessibles à Paris Gare de Lyon, Nice, Bordeaux, Poitiers et Limoges. Petits et grands retrouvent les magnifiques dessins des trois premiers tomes de la saga.

Le week-end des 28 et 29 août 2021, le 'Retour à Poudlard' prévoit un beau programme ! Le Pouldard Express grandeur nature, un pop-up store animé par la FNAC de 10h à 19h, un photocall de la voie 9 ¾... Rendez-vous sur le parvis de la gare Saint-Lazare pour en profiter.

Du 28 août au 10 octobre, une autre exposition Harry Potter est prévue, cette fois autour des illustrations des studios Minalima sur le premier tome (déjà disponible) et sur le second tome (à paraître à l'automne).

À partir du 28 août également, l'expérience Harry Potter en réalité augmentée réalise le rêve des jeunes fans : passer la voie 9 ¾ ! Ce lieu mythique de la station King's Cross de Londres est à retrouver en avant-première dans les 31 gares partenaires et tous les magasins FNAC via un QR code, puis dans les smartphones le 1er septembre via les comptes Facebook @harrypotterfilms et Instagram @warnerbrosfr.

Parmi les gares partenaires, on retrouve : Aix-en-Provence TGV, Amiens, Besançon Viotte, Bordeaux Saint-Jean, Clermont-Ferrand, Dijon Ville, Grenoble, Le Havre, Lille Europe, Lille Flandres, Limoges Bénédictin, Lyon Part Dieu, Marseille Saint-Charles, Metz, Montpellier Saint-Roch, Nancy, Nantes, Nice Ville, Paris Gare d’Austerlitz, Paris Gare de l’Est, Paris Gare de Lyon, Paris Gare du Nord, Paris Gare Montparnasse, Paris Saint-Lazare, Poitiers, Reims, Rennes, Rouen, Strasbourg, Toulouse Matabiau, Tours.

Un événement en collaboration entre les gares SCNF, Gallimard Jeunesse, Warner Bros et la FNAC.", min_age: 6, max_age: 12, user: User.all.sample, photo:"https://www.citizenkid.com/uploads/medias/cache/post_cover/rc/jTPZVgwU//uploads/medias/04/b4/04b4d2d8ea89b70d28b656afb1f050aa7287c9c8.jpeg")
Offer.create!(name: "La Princesse au petit pois dans la tête", address: "Théâtre Le Bout
6 rue Frochot
75009 Paris", url: "https://lebout.com/", start_date: "2021-06-16", end_date: "2021-08-30", permanent: false, description: "La Princesse n'est pas au bout de ses peines. L'ogre prépare un grand festin et s'apprête à capturer le plus d'enfants possible.

Le roi s'enfuit pour demander de l'aide et laisse le royaume aux mainx de la jeune fille, pas très futée.

Heureusement, le jeune dentiste du château vient à son secours. Un véritable chevalier celui-là !

Aventure, quiproquos, péripéties... Petits et grands ne vont pas s'ennuyer !

Pour la 16e année consécutive, le spectacle séduit toute la famille. L'aventure continue...", min_age: 3, user: User.all.sample, photo: "https://www.citizenkid.com/uploads/medias/cache/post_cover/rc/GZnh57D5//uploads/medias/bb/2f/bb2f578d9a767090b4c003bb34908b203eeba582.jpeg")
Offer.create!(name: "La Cité des enfants", address: "30 avenue Corentin Cariou 75019 Paris, France", url: "https://www.cite-sciences.fr/fr/au-programme/expos-permanentes/la-cite-des-enfants/cite-des-enfants-2-7-ans/", permanent: true, description: "La Cité des enfants 2-7 ans est ouverte à la petite enfance dès 2 ans, et s’organise sur 1700 m² découpés en cinq espaces thématiques : Je me découvre, Je sais faire, Je me repère, J’expérimente, Tous ensemble.

Les trois premiers thèmes sont centrés sur le développement de l’enfant et ses facultés corporelles, cognitives, spatiales. Les deux suivants proposent une ouverture au monde et aux autres.

Pour aider les adultes à trouver leur place dans cet espace, des pictogrammes suggèrent de jouer avec son enfant, de l’encourager, ou de simplement l’observer.

Une attention particulière a été portée au public handicapé et de nombreuses activités sont accessibles à tous les handicaps. Les accompagnateurs handicapés ont aussi été pris en compte : des textes en braille sont notamment accessibles aux parents non-voyants.

Pour aider les adultes à trouver leur place dans cet espace, des pictogrammes suggèrent de jouer avec son enfant, de l’encourager, ou de simplement l’observer.

Une attention particulière a été portée au public handicapé et de nombreuses activités sont accessibles à tous les handicaps. Les accompagnateurs handicapés ont aussi été pris en compte : des textes en braille sont notamment accessibles aux parents non-voyants.", min_age: 2, max_age: 7, schedule: "mardi	09:30–18:00
mercredi	09:30–18:00
jeudi	09:30–18:00
vendredi	09:30–18:00
samedi	09:30–18:00
dimanche	09:30–19:00
lundi	Fermé", user: User.all.sample, photo: "https://www.cite-sciences.fr/fileadmin/_migrated/pics/Ens-Cite-votre-visite-CDE.jpg")
Offer.create!(name: "jardin du luxembourg", address: "jardin du luxembourg, 75006 Paris", permanent: true, description: "Le jardin du Luxembourg est un jardin ouvert au public, situé dans le 6ᵉ arrondissement de Paris.", min_age: 0, schedule: "https://www.senat.fr/visite/jardin/horaires.html", user: User.all.sample, photo: "https://www.cityzeum.com/images/lieu/bigstock-paris-park-27564803.jpg")
Offer.create!(name: "Ferme de Paris", address: "Route du Pesage  75012  Paris 12e ", url: "https://www.paris.fr/equipements/la-ferme-de-paris-6597", permanent: true, description: "La Ferme de Paris, de son ancien nom Ferme Georges Ville, est une ferme pédagogique et environnementale située dans le bois de Vincennes, à côté de l'hippodrome de Vincennes dans le 12ᵉ arrondissement de Paris.", min_age: 0, schedule: "Ouvert tous les samedis et dimanches à partir de 13h30
  Ouvert du mardi au vendredi pendant les vacances de printemps (zone C) et les vacances d’été à partir de 13h30
  Fermeture les jours fériés", user: User.all.sample, photo: "https://www.leparisien.fr/resizer/v6sPqBZ6nFkxqUdAh3vxCnqRkR0=/932x582/arc-anglerfish-eu-central-1-prod-leparisien.s3.amazonaws.com/public/KESMU7KLVCW7PLJ4L6OWXCWUXU.jpg")
#Offer.create!(name: , address: , url: , start_date: , end_date: , permanent: , description: , min_age: , max_age: , schedule: , user: User.all.sample, photo:)
