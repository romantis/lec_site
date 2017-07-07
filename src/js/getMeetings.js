import reqwest from 'reqwest';

function fetchMeetings(url) {
    return reqwest(url)
            .then(function(meetings) {
                // Life time of local cache 
                var expired = + new Date + 1000 * 3600 * 24 * 7;
                localStorage.setItem('meetings', JSON.stringify({data: meetings, expired: expired}));

                return meetings;
            });
}


export default function(url) {
    if (localStorage.meetings) {
        try {
            var meetings = JSON.parse(localStorage.getItem('meetings'));
            if ( meetings.expired > (+ new Date)) 
                return Promise.resolve(meetings.data);
        } catch(err) {
            // It is only about parsing error
            console.error(err);
            return;
        }
    } 
    return fetchMeetings(url);
}