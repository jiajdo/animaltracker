import moment from "moment";

const Sightings = (props) => {
  return (
    <div>
      <table>
        <thead>
          <th>Nickname</th>
          <th>Location</th>
          <th>Date of Sighting</th>
          <th>Healthy?</th>
          <th>Scientist Email</th>
          <th>Record Creation Date</th>
          <th>Hello</th>
        </thead>
        <tbody>
          {props.sightings.map((sighting, index) => {
            return (
              <tr key={index}>
                <td>{sighting.individual}</td>
                <td>{sighting.sighting_location}</td>
                <td>{moment(sighting.dateandtime).format("MMMM Do, YYYY")}</td>
                <td>{sighting.is_healthy.toString()}</td>
                <td>{sighting.email_address}</td>
                <td>{moment(sighting.timestamp).format("MMMM Do, YYYY")}</td>
              </tr>
            );
          })}
        </tbody>
      </table>
    </div>
  );
};

export default Sightings;
