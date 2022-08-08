Choir
-has one admin
-has many songs
properties:

-name
-message

Category
-belongs to choir
-has many songs

Song
-belongs to category


Todo:

- Add Admins#login to Docs
- Remove id from params needed in docs. Combine endpoints when appropriate
- Add id to endpoint for Admins#update
- Remove the various authorized_for methods from application_controller and put them in other controllers
- In production, give choir record an admin_id

- In parts_controller, provide a better response than 500 for when recording not provided

1. Add create/update action to admin and choir
2. Add categories configure relevant associations
3. Get rid of parts_promised
4. Add autocomplete search service