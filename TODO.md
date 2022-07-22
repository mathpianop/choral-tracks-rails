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
- See if Ruby allows what I think it does to make 
    ApplicationController#choir_belongs_to_admin? more clear
1. Make Admins one-to-many with Choirs (need to redo login, for one)
2. Add create action to admin
3. Add categories configure relevant associations
4. Get rid of parts_promised
5. Add autocomplete search service