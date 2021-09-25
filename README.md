# Choral Tracks: Rails

This is the Rails backend for my React Choral Tracks app (https://github.com/mathpianop/choral-tracks-react). It uses a JSON API to communicate with the frontend and JSON Web Tokens for authentication. If you want to run Choral Tracks locally, you'll need to run this backend as well.

The database primarily exists to stores URLs for assets associated with the Songs, such audio part recordings and (eventually) sheet music. The assets are uploaded to the cloud storage service Cloudinary.

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