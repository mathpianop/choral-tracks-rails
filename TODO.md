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

nested route choirs do admins


Todo:

- Fix Choirs#edit to include choir details, organize like Choirs#show
- Get rid of Songs#index
- rename recording to recording_url??
- Modify Admins controller methods to include songs of the choirs (doubly nested)
- Test login and auth

1. Add create action to admin
2. Add categories configure relevant associations
3. Get rid of parts_promised
4. Add autocomplete search service