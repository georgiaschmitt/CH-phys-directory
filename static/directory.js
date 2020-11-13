"use strict";

// const addToBookmarks = (physician) => {
//     $('#bookmarks').append(`
//       <tr>
//         <td>${physician}</td>
//       </tr>
//     `);
//   };


// // Event handlers

// $('.add-to-bookmarks').on('click', () => {
//     addToBookmarks(physician);
//     incrementBookmark(1);

//   });


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