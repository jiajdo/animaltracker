import cors from 'cors';
import express from 'express';
import 'dotenv/config';
import db from "../server/db-connection.js";


const app = express();
app.use(cors());


//Set the port that you want the server to run on
const PORT = process.env.PORT || 8080;



//creates an endpoint for the route /api
app.get('/', (req, res) => {
  res.send('This is the home page')
});


// console.log that your server is up and running
app.listen(PORT, async () => {
  console.log(`Your girl is listening on ${PORT}`);
  // const { rows: tables} = await db.query("SELECT * FROM species;");
  //   console.log({ tables });
  //   // console.log(db)
  
});