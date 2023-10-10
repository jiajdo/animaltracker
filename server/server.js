import cors from "cors";
import express from "express";
import "dotenv/config";
import db from "../server/db-connection.js";

const app = express();
app.use(cors());

//Set the port that you want the server to run on
const PORT = process.env.PORT || 8080;

//creates an endpoint for the route /
app.get("/", (req, res) => {
  res.send("Hello, this is the home page");
});

app.get("/sightings", async (req, res) => {
  try {
    const { rows: sightings } = await db.query("SELECT * FROM sightings;");
    res.send(sightings);
    console.log("sightings from server", sightings);
  } catch (e) {
    return res.status(400).json({ e });
  }
});

app.get("/species", async (req, res) => {
  try {
    const { rows: species } = await db.query("SELECT * FROM species;");
    console.log("species from server", species);
    res.send(species);
  } catch {
    console.log(e);
    return res.status(400).json({ e });
  }
});

// Show a list of all species, including the nickname of the
//individual sighted at each one (using a JOIN query)

//get all individuals and join with species_id

app.get("/species/:speciesId", async (req, res) => {
  try {
    const speciesId = req.params.speciesId;
    const result = await db.query(
      "SELECT nickname, species_id FROM individuals INNER JOIN species ON species_id = species_id WHERE species_id = $1", [speciesId]
    );
    res.json(result.rows);
  } catch (e) {
    console.log(e);
    return res.status(400).json({e});
  }
});

app.post('/addSighting', async (req, res) => {
  try {
      const newAnimal = {nickname: req.body.nickname, species: req.body.scientific_name, timestamp: new Date()}
      const newSighting = {location: req.body.location, datetime: req.body.datetime, sighter_email: req.body.sighter_email, healthy: req.body.healthy}
      const result = await db.query(
          `INSERT INTO species (common_name, scientific_name,record_creation_timestamp) VALUES($1, $2, $3) RETURNING *`,
          [newAnimal.nickname, newAnimal.scientific_name, newAnimal.timestamp]
      );

      const result1 = await db.query(
          `INSERT INTO sightings (dateandtime, individual, sighting_location,is_ healthy, email_address, sightings_timestamp) VALUES($1, $2, $3, $4, $5, $6) RETURNING *`,
          [newSighting.datetime, newAnimal.individual, newSighting.sighting_location, newSighting.is_healthy, newSighting.email_address, newAnimal.timestamp]
      );

      let dbResponse = result.rows[0];
      let dbResponse2 = result1.rows[0];
      return res.status(200).end();
  } catch (e) {
      return res.status(400).json({ e });
  }
});


// console.log that your server is up and running
app.listen(PORT, async () => {
  console.log(`Your girl is listening on ${PORT}`);

});
