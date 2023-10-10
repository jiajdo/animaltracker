# animaltracker
Add animal sightings to the database and see others' entries of animals from all over the world.

# Packages and Dependencies
React, Express, Cors, Node, Nodemon, Moment

A frontend and backend server is already set up. `cd server` then `npm run dev` to activate both concurrently. 

#Database

Database was made with psql. See `animaltracker.psql` for backup. 

If you have postgres set up postgres with an User, run  `psql -U postgres -f db.sql`. Make sure that you have your Postgres password on hand. The psql console will ask for your password. 

If your initial configuration of postgres doesn't require a User, run `psql -f db.sql`
