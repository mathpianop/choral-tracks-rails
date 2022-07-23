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

1. Add/modify the following to accomodate admins with multiple choirs
  - admins#show (currently contains what should be choirs#edit)
  - admins#update
  - choirs#edit
  - update API Docs
2. Add create action to admin
3. Add categories configure relevant associations
4. Get rid of parts_promised
5. Add autocomplete search service