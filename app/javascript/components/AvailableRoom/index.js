import React from 'react';
import classes from './styles.module.css'

const AvailbaleRoom = ({ rooms, onAdd, onRemove }) => {
  return (
    <div className={classes.container}>
      <h4>{`Availbale Rooms ${rooms.length}`}</h4>
      {rooms.length > 0 && rooms.map((room, i) => {
        return (
          <label>
            Room Number {room.id}
          </label>
        )
      })}
      <h6> Please pick your action </h6>
      <button onClick={ onAdd } disabled={rooms.length===0}>
        Checkin to Hotel
      </button>
      <button onClick={ onRemove }disabled={rooms.length==4}>
        Checkout to Hotel
      </button>
      
    </div>
  )
};

export default AvailbaleRoom;