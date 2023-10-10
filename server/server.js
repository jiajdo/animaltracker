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

// console.log that your server is up and running
app.listen(PORT, async () => {
  console.log(`Your girl is listening on ${PORT}`);
  // const { rows: tables} = await db.query("SELECT * FROM species;");
  //   console.log({ tables });
  //   // console.log(db)
});
