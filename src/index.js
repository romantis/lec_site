import Elm from './elm/Main.elm';

import getMeetings from './js/getMeetings';

import bkpMeetings from "./content/meetings.json";

const MEETINGS_URL = 
    'https://lecserver-qilnosxwmk.now.sh/meetings';
    

const mountNode = document.getElementById('app');

const app = Elm
    .Main
    .embed(mountNode);


getMeetings(MEETINGS_URL)
    .then(function(meetings) { 
        app.ports.meetings.send(meetings)
    })
    .catch(function(err) {
        // in case request to fetch meetings failed
        console.error(err);
        app.ports.meetings.send(bkpMeetings);
    });