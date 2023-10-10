import moment from 'moment';

const Sightings = (props) => {

    return (
        <div>
            <table>
            <thead>
                    <th>Species</th>
                    <th>Location</th>
                    <th>Date of Sighting</th>
                    <th>Healthy?</th>
                    <th>Spotter</th>
                    <th>Record Creation Date</th>
                    <th>Cryptid Name</th>
                </thead>
                <tbody>
                {props.sightings.map((sighting, index) => {
                    return <tr key={index}>
                        <td>{sighting.species}</td>
                        <td>{sighting.location}</td>
                        <td>{moment(sighting.datetime).format("MMMM Do, YYYY")}</td>
                        <td>{sighting.healthy.toString()}</td>
                        <td>{sighting.sighter_email}</td>
                        <td>{moment(sighting.timestamp).format("MMMM Do, YYYY")}</td>
                        <td>{sighting.nickname}</td>
                    </tr>
                })}
                </tbody>
            </table>
        </div>
    )
}

export default Sightings;