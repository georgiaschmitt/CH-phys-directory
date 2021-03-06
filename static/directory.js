"use strict";


function initMap() {
    const usa = { lat: 39.8283, lng: -98.5795};
    const map = new google.maps.Map(document.getElementById("map"), {
        zoom: 3.5,
        center: usa,
    });
    const locationInfo = new google.maps.InfoWindow();

   
    $.get('/api/locations', (locations) => {
        for (const loc of locations) {

            const locationInfoContent = (`
                <div class="window-content">
                    ${loc.id}<br>
                    <b>${loc.providers}</b><br>
                    ${loc.institution}<br>
                    ${loc.city}, ${loc.state}</li>
                </div>
            `);
            const locationMarker = new google.maps.Marker({
                position: {
                    lat: loc.lat,
                    lng: loc.lng
                },
                map:map,
            });

            locationMarker.addListener('click', () => {
                locationInfo.close();
                locationInfo.setContent(locationInfoContent);
                locationInfo.open(map, locationMarker);
            });
        }
    }).fail(() => {
        alert((`Data not able to be loaded!`));
    });
}




// const addToBookmarks = (physician) => {
//     $('#bookmarks').append(`
//       <tr>
//         <td>${physician}</td>
//       </tr>
//     `);
//   };


// // Event handlers

$('.bookmark').on('click', (evt) => {
    const button = $(evt.target);
    const buttonId = button.attr('id');

    const formInputs = {
        'physician': buttonId
    };

    button.prop('disabled', true);
    button.html("&nbsp;&nbsp;&nbsp;&nbsp;Bookmarked&nbsp;&nbsp;&nbsp;&nbsp;")

    $.post('/new-bookmark', formInputs, (res) => {
    });
});

$('.rm-bookmark').on('click', (evt) => {
    const button = $(evt.target);
    const buttonId = button.attr('id');

    const formInputs = {
        'physician': buttonId
    };

    button.prop('disabled', true);
    button.html("Removed")

    $.post('/remove-bookmark', formInputs, (res) => {
    });
});