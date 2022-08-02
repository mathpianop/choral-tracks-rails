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

- Test login and auth

1. Add create/update action to admin and choir
2. Add categories configure relevant associations
3. Get rid of parts_promised
4. Add autocomplete search service