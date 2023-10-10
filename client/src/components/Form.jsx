import { useState, useRef } from 'react';
import { Button, Form } from "react-bootstrap"

const AddSighting = (props) => {
    const userDate = useRef();
    const userSpecies = useRef();
    const userLocation = useRef();
    const userHealthy = useRef();
    const userScientist = useRef();
    const userNickname = useRef();

    const handleSubmit = async (e) => {
        e.preventDefault();
        const selectedDate = new Date(userDate.current?.value);
        const userEvent = {species: userSpecies.current?.value, location: userLocation.current?.value, datetime: selectedDate.toISOString(), healthy: userHealthy.current?.checked, sighter_email: userScientist.current?.value, nickname: userNickname.current?.value, timestamp: new Date()}
        handlePostRequest(userEvent);
    }

    const handlePostRequest = (data) => {
        fetch("http://localhost:8080/sightings", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(data),
        })
            .then((response) => {if (response.status == 200) {props.onGetRequest}});
    };

    return (
        <div>
            <Form onSubmit={handleSubmit}>
                <Form.Group>
                    <Form.Label>Species:</Form.Label>
                    <input type="text" ref={userSpecies} required></input>
                </Form.Group>
                <Form.Group>
                    <Form.Label>Location:</Form.Label>
                    <input type="text" ref={userLocation} required></input>
                </Form.Group>
                <Form.Group>
                    <Form.Label>Date of Sighting:</Form.Label>
                    <input type="date" ref={userDate} required></input>
                </Form.Group>
                <Form.Check type="checkbox" ref={userHealthy} label="Are they healthy?"></Form.Check>
                <Form.Group>
                    <Form.Label>Scientist Email:</Form.Label>
                    <input type="text" ref={userScientist} required></input>
                </Form.Group>
                <Form.Group>
                    <Form.Label>Animal Nickname:</Form.Label>
                    <input type="text" ref={userNickname} required></input>
                </Form.Group>
                <Form.Group>
                    <Button type="submit" variant="outline-success">Submit Sighting</Button>
                </Form.Group>
            </Form>
        </div>
    )
}

export default AddSighting;