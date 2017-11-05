import Elm from './elm/Main.elm';

import getMeetings from './js/getMeetings';

import embededMeetings from "./content/meetings.json";

const MEETINGS_URL = 
    'https://us-central1-lecsite-185112.cloudfunctions.net/lecmeetings';
    

const mountNode = document.getElementById('app');

const app = Elm
    .Main
    .embed(mountNode);

// Send embeded meetings first
app.ports.meetings.send(embededMeetings);

// Try to fetch fresh meetings, But it may fail or take some time to load.
getMeetings(MEETINGS_URL)
    .then(function(meetings) { 
        app.ports.meetings.send(meetings)
    })
    .catch(function(err) {
        // in case request to fetch meetings failed
        console.error(err);
    });