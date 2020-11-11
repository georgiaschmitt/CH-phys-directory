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



    $.get('https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=Mayo%20Clinic%20Rochester&inputtype=textquery&fields=formatted_address,name,geometry&key=AIzaSyAmekBy-tOKe3uQr7priiJ7te4a_nLSUV0', (data) => {

        console.log(data)

    }


// $.get('https://pokeapi.co/api/v2/berry?limit=20', (data) => {

//     for (const berry in data.results) {
//         $('#berries').append(`${data.results[berry].name}<br>`);
//     }
// });