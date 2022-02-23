# Choral Tracks: Rails

This is the Rails backend for my React Choral Tracks app (https://github.com/mathpianop/choral-tracks-react). It uses a JSON API to communicate with the frontend and JSON Web Tokens for authentication. If you want to run Choral Tracks locally, you'll need to run this backend as well.

The database primarily exists to stores URLs for assets associated with the Songs, such audio part recordings and (eventually) sheet music. The assets are uploaded to the cloud storage service Cloudinary.

## Table of Contents

* [API reference](#api-reference)
	- [Choir](#choir)
	- [Song](#choir)
* [Installation and JWT setup](#installation-and-javaScript-web-tokens-setup)


## API reference

### Choir

Represents all the info and songs for a given choir

* choir_details: `object`
 	* name: `string`
  	* message: `string`
  	
    
* songs: [Song](#song) `array`


##### Endpoints

`GET` "https://choral-tracks.herokuapp.com/api/choir/**:choir_id**"

Retrieves a single choir

###### Response Example


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

### Song

Represents the info and parts of a given song

* "choir_id" `integer` (The id of the choir associated with the song)
* "id" `integer`
* "parts_count" `integer` (The number of parts with uploaded recordings)
* "parts_promised" `integer` (The number of parts that were attempted to be uploaded)
* "title" `string`

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