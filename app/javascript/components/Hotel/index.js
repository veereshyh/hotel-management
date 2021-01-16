import React, { useState, useEffect } from 'react';
import AvailbaleRoom from '../AvailableRoom';
import Loader from '../Loader';
import classes from './styles.module.css'

const Home  = () => {
  const [rooms, setRooms] = useState({});
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const url = "/hotels/1/available_rooms";
    fetch(url)
      .then(response => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then(response => {
        setRooms(response);
        setLoading(false);
      })
      .catch(() => console.log('An error occurred while fetching the rooms'));
  }, []);

  const handleCheckin = () => {
    const url = "/hotels/1/checkin";
    const data = {
      "hotel_room": {
        "room_id": "1",
        "user_id": "1"
     }
    }
    fetch(url, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(data)
    })
    //TODO need to refresh only button object
    window.location.reload(false);
  }

  const handleCheckout = () => {
    const url = "/hotels/1/checkout";
    const data = {
      "hotel_room": {
        "room_id": "1",
        "user_id": "1"
      }
    }
    fetch(url, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(data)
    })
    //TODO need to refresh only button object
    window.location.reload(false);
  }

  return (
    <div className={classes.container}>
      <h1>Hotel Royal Rock!</h1>
      <p>
       Hurry!!! Limited Rooms Availbale
      </p>
      
      <hr/>
      {
        loading ? <Loader /> : (
          <div>
            <AvailbaleRoom rooms={rooms} onAdd={handleCheckin} onRemove={handleCheckout} /> 
          </div>
        )
      }
  </div>
  )
}

export default Home;