# Choral Tracks: Rails

This is the Rails back end for my React Choral Tracks app (https://github.com/mathpianop/choral-tracks-react). It uses a JSON API to communicate with the front end and JSON Web Tokens for authentication.

The database primarily exists to stores URLs for assets associated with the Songs, such audio part recordings and (eventually) sheet music. The assets are uploaded to the cloud storage service Cloudinary.

## Installation and JWT setup

First, clone the repository and install the necessary gems.

```bash
git clone git@github.com:mathpianop/choral-tracks-rails.git
cd choral-tracks
bundle install
```
<br>
<br>

Then, create and migrate the database:

```bash
rails db:create && rails db:migrate
```
<br>
<br>

Start up the Rails console with `rails c` and generate a JWT base64 secret key:

```ruby
irb(main):001:0> SecureRandom.base64(32).first(32)
=> "z2V0B0MTy+dvUYuy2qaX495tVj0v8zmS"
```
<br>
<br>

Create a `.env` file in the root of the directory and place your JWT secret, like so:

```bash
JWT_SECRET=z2V0B0MTy+dvUYuy2qaX495tVj0v8zmS
```
<br>
<br>

Finally, seed the database with sample Songs and Parts, and sample Admin credentials:
```bash
rails db:seed
```
<br>
<br>

To get things started with the front end, fire up the rails server with `rails s`