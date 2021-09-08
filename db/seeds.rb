# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sample = Admin.create(username: "sample", password: "password")

song_1 = Song.create(title: "Ascension Megalonarion", parts_promised: 4)
song_2 = Song.create(title: "It Is Truly Meet", parts_promised: 3)
song_3 = Song.create(title: "Partially Uploaded Song", parts_promised: 4)

song_1_part_1 = Part.create(
                      name: "Soprano", 
                      recording: "https://res.cloudinary.com/choral-tracks/video/upload/v1624987141/mxfylbcqbfpxo1jrmmad.mp3",  
                      initial: "S", 
                      song_id: song_1.id, 
                      pitch_order: 1,
                      public_id: "v1624987141/mxfylbcqbfpxo1jrmmad"
                    )
song_1_part_2 = Part.create(
                      name: "Alto", 
                      recording: "https://res.cloudinary.com/choral-tracks/video/upload/v1624987143/wjgnnivpehyrubrc5zzn.mp3", 
                      initial: "A", 
                      song_id: song_1.id, 
                      pitch_order: 2,
                      public_id: "wjgnnivpehyrubrc5zzn"
                    )
song_1_part_3 = Part.create(
                      name: "Tenor", 
                      recording: "https://res.cloudinary.com/choral-tracks/video/upload/v1624987146/fcsgl5b5guhma2m2mzpb.mp3",
                      initial: "T", 
                      song_id: song_1.id, 
                      pitch_order: 3,
                      public_id: "fcsgl5b5guhma2m2mzpb"
                    )
song_1_part_4 = Part.create(
                      name: "Bass", 
                      recording: "https://res.cloudinary.com/choral-tracks/video/upload/v1624987144/ji7jc9z6xsbx2jkicvvc.mp3",
                      initial: "B", 
                      song_id: song_1.id, 
                      pitch_order: 4,
                      public_id: "ji7jc9z6xsbx2jkicvvc"
                    )

song_2_part_1 = Part.create(
                      name: "Melody", 
                      recording: "https://res.cloudinary.com/choral-tracks/video/upload/v1624986047/dtromdysoic3bufzhhyb.mp3", 
                      initial: "M", 
                      song_id: song_2.id, 
                      pitch_order: 1,
                      public_id: "dtromdysoic3bufzhhyb"
                    )
song_2_part_2 = Part.create(
                      name: "Tenor", 
                      recording: "https://res.cloudinary.com/choral-tracks/video/upload/v1624986209/kzir5itzhvhnrknrvz3h.mp3", 
                      initial: "T", 
                      song_id: song_2.id, 
                      pitch_order: 2,
                      public_id: "kzir5itzhvhnrknrvz3h"
                    )
song_2_part_3 = Part.create(
                      name: "Bass", 
                      recording: "https://res.cloudinary.com/choral-tracks/video/upload/v1624986213/mbcfovoemblfs4sn0hdy.mp3", 
                      initial: "B", 
                      song_id: song_2.id, 
                      pitch_order: 3,
                      public_id: "mbcfovoemblfs4sn0hdy"
                    )
song_3_part_1 = Part.create(
                      name: "Soprano", 
                      recording: "https://res.cloudinary.com/choral-tracks/video/upload/v1624987141/mxfylbcqbfpxo1jrmmad.mp3", 
                      initial: "S", 
                      song_id: song_3.id, 
                      pitch_order: 1,
                      public_id: "v1624987141/mxfylbcqbfpxo1jrmmad"
                    )
song_3_part_2 = Part.create(
                      name: "Alto", 
                      recording: "https://res.cloudinary.com/choral-tracks/video/upload/v1624987143/wjgnnivpehyrubrc5zzn.mp3", 
                      initial: "A", 
                      song_id: song_3.id, 
                      pitch_order: 2,
                      public_id: "wjgnnivpehyrubrc5zzn"
                    )
song_3_part_4 = Part.create(
                      name: "Bass", 
                      recording: "https://res.cloudinary.com/choral-tracks/video/upload/v1624987144/ji7jc9z6xsbx2jkicvvc.mp3",
                      initial: "B", 
                      song_id: song_3.id, 
                      pitch_order: 4,
                      public_id: "ji7jc9z6xsbx2jkicvvc"
                    )