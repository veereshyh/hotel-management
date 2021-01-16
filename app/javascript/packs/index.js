import React from 'react'
import ReactDOM from 'react-dom'
import 'bootstrap/dist/css/bootstrap.min.css';
import $ from 'jquery';
import Popper from 'popper.js';
import 'bootstrap/dist/js/bootstrap.bundle.min';
import Hotel from '../components/Hotel';

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Hotel />,
    document.body.appendChild(document.createElement('div')),
  )
})