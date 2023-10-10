import { useState, useEffect } from "react"
import {Button, Form} from "react-bootstrap"
import AddSighting from "./components/Form.jsx"
import 'bootstrap/dist/css/bootstrap.min.css';
import Sightings from "./components/Sightings.jsx";


const App = () => {
  const [sightings, setSightings] = useState([]);
  const loadSightings = () => {
    fetch("http://localhost:8080/sightings")
        .then((response) => response.json())
        .then((sighting) => {
            setSightings(sighting);
        });
}

useEffect(() => {
  loadSightings();
}, [sightings]);

  return (
    <div className="App">
      

      <Sightings sightings={sightings} />
      <AddSighting onGetRequest={loadSightings} />
    </div>
  )
}

export default App