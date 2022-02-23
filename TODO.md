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

1. Create choir and configure relevant associations
2. Add create action to admin
3. Add categories configure relevant associations
4. Add autocomplete search service
