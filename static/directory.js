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
        const marker = new google.maps.Marker({
          position: usa,
          map: map,
        });
    }


$.get('/api/locations', (locations) => {
        for (const loc of locations) {



//     for (const berry in data.results) {
//         $('#berries').append(`${data.results[berry].name}<br>`);
//     }
// })