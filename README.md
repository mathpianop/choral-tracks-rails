# Choral Tracks: Rails

This is the Rails backend for my React Choral Tracks app (https://github.com/mathpianop/choral-tracks-react). It uses a JSON API to communicate with the frontend and JSON Web Tokens for authentication. If you want to run Choral Tracks locally, you'll need to run this backend as well.

The database primarily exists to stores URLs for assets associated with the Songs, such audio part recordings and (eventually) sheet music. The assets are uploaded to the cloud storage service Cloudinary.

## Table of Contents

* [API reference](#api-reference)
	- [Admin](#Admin)
   - [Choir](#Choir)
	- [Song](#Song)
   - [Part](#Part)
* [Installation and JWT setup](#installation-and-javaScript-web-tokens-setup)


## API reference

### Admin

Represents the info and choirs associated with an admin account. Each admin can administrate multiple choirs

* admin_details: `object`
   * username: `string`

* choirs: [Choir](#choir) `array`

##### Endpoints

`GET` "https://choral-tracks.herokuapp.com/api/admins/**:admin_id**"

Retrieves a single admin
- Requires a JWT Auth Token obtained at "api/admins/login"

`PATCH` "https://choral-tracks.herokuapp.com/api/admins/**:admin_id**"

Updates a single admin
- Requires a JWT Auth Token obtained at "api/admins/login"

May include the following params:

* username: `string`


`GET` "https://choral-tracks.herokuapp.com/api/admins/login"

Requests a JWT Auth Token for the admin with the supplied credentials

Requires the following params

* username: `string`
* password: `string`


### Choir

Represents all the info and songs for a given choir

* choir_details: `object`
  * name: `string`
  * message: `string`
  	
    
* songs: [Song](#song) `array`

##### Response Example


```json
{
   "choir_details" : {
      "name" : "Holy Transfiguration Choir",
      "updated_at" : "2022-02-23T20:45:32.206Z",
      "id" : 1,
      "message" : "Welcome to the HT choral resources! Hopefully, there will be a lot more to come, but for right n\now, check out the song player below. If you click on one of the titles, you can play the song with options to hear your part by itself (\"isolate\"), or with the other parts softer (\"emphasize\")",
      "created_at" : "2022-02-23T20:10:09.185Z"
   },
   "songs" : [
      {
         "updated_at" : "2022-02-23T20:30:58.319Z",
         "choir_id" : 1,
         "id" : 2,
         "parts_count" : 4,
         "title" : "Ascension Megalonarion",
         "parts_promised" : 4,
         "created_at" : "2021-09-09T01:12:51.788Z"
      },
      {
         "title" : "It Is Truly Meet",
         "parts_count" : 3,
         "created_at" : "2021-09-09T01:12:51.805Z",
         "parts_promised" : 3,
         "updated_at" : "2022-02-23T20:30:58.326Z",
         "id" : 3,
         "choir_id" : 1
      }
   ]
}

```


##### Endpoints

`GET` "https://choral-tracks.herokuapp.com/api/choirs/**:choir_id**"

Retrieves a single choir, with only the songs that have all the parts uploaded


`GET` "https://choral-tracks.herokuapp.com/api/choirs/**:choir_id**/edit" 

Retrieves a single choir, including those songs that do not have all their parts uploaded. 
- Requires a JWT Auth Token obtained at "api/admins/login"


### Song

Represents the info and number of parts of a given song

* "choir_id" `integer` (The id of the choir associated with the song)
* "id" `integer`
* "parts_count" `integer` (The number of parts with uploaded recordings)
* "parts_promised" `integer` (The number of parts that were attempted to be uploaded)
* "title" `string`


##### Endpoints

`GET` "https://choral-tracks.herokuapp.com/api/songs/**:song_id**"

Retrieves a single song


`POST` "https://choral-tracks.herokuapp.com/api/songs/"

Creates a song (no parts)

Requires the following params:

* "choir_id" `integer` (The id of the choir associated with the song)
* "parts_promised" `integer` (The number of parts that were attempted to be uploaded)
* "title" `string`



`PATCH` "https://choral-tracks.herokuapp.com/api/songs/**:song_id**"

Updates the song with the given id (does not directly affect associated parts)

May include the following params:

* "choir_id" `integer` (The id of the choir associated with the song)
* "parts_promised" `integer` (The number of parts that were attempted to be uploaded)
* "title" `string`

`DELETE` "https://choral-tracks.herokuapp.com/api/songs/**:song_id**"

Deletes the song with the given id


### Part

Represents a choral part (e.g. Soprano) belonging to a particular song. Has an audio file associated with it that gets uploaded to Cloudinary

* "id" `integer` (The id of the part)
* "song_id" `integer` (The id of the song associated with the part)
* "name" `string` (The name of the part; e.g. Soprano)
* "initial" `string` (The initial of the part, e.g. "S" for Soprano)
* "pitch_order" `integer` (The pitch order of the part compared to other parts in the song, from high to low. For example, Alto might have a pitch order of 2)
* "recording_url" `string` (The full Cloudinary URL of the uploaded audio file)
* "public_id" `string` (The string that uniquely identifies the file at Cloudinary, and is the final slug of the URL before the file extension)

##### Response Example

```json
{
   "id": 9,
   "song_id": 4,
   "initial": "A",
   "recording": "https://res.cloudinary.com/choral-tracks/video/upload/v1624987143/wjgnnivpehyrubrc5zzn.mp3",
   "name": "Alto",
   "created_at": "2021-09-09T01:12:51.982Z",
   "updated_at": "2021-09-09T01:12:51.982Z",
   "pitch_order": 2,
   "public_id": "wjgnnivpehyrubrc5zzn"
}
```

##### Endpoints

`GET` "https://choral-tracks.herokuapp.com/api/songs/**:song_id**/parts"

Retrieves all the parts corresponding to the given song


`GET` "https://choral-tracks.herokuapp.com/api/songs/**:song_id**/parts/**:part_id**"

Retrieves a single part corresponding to the given song


`POST` "https://choral-tracks.herokuapp.com/api/songs/**:song_id**/parts"

Creates a new part corresponding to the given song, uploading the audio file to Cloudinary

Requires the following params:

* "name" `string` (The name of the part; e.g. Soprano)
* "initial" `string` (The initial of the part, e.g. "S" for Soprano)
* "pitch_order" `integer` (The pitch order of the part compared to other parts in the song, from high to low. For example, Alto might have a pitch order of 2)
* "recording" `audio file` (The audio file recording of the part)


`PATCH` "https://choral-tracks.herokuapp.com/api/songs/**:song_id**/parts/**:part_id**"

Updates the given part corresponding to the given song, uploading a new audio file to Cloudinary if provided

May include the following params:

* "name" `string` (The name of the part; e.g. Soprano)
* "initial" `string` (The initial of the part, e.g. "S" for Soprano)
* "pitch_order" `integer` (The pitch order of the part compared to other parts in the song, from high to low. For example, Alto might have a pitch order of 2)
* "recording" `audio file` (The audio file recording of the part)


`DELETE` "https://choral-tracks.herokuapp.com/api/songs/**:song_id**/parts/**:part_id**"

Deletes the given part corresponding to the given song, destroying the Cloudinary audio file




## Installation and JavaScript Web Tokens setup

First, clone the repository and install the necessary gems.

```bash
git clone git@github.com:mathpianop/choral-tracks-rails.git
cd choral-tracks-rails
bundle install
```
<br>

Then, create and migrate the database:

```bash
rails db:create && rails db:migrate
```
<br>

Generate and set a JWT secret key with the following bash script:

```bash
bash create-secret.sh
```
<br>

Finally, seed the database with sample Songs and Parts, and sample Admin credentials:
```bash
rails db:seed
```
<br>

To get things started with the frontend, fire up the rails server with `rails s`

## License

Choral Tracks is released under the [MIT License](https://opensource.org/licenses/MIT)