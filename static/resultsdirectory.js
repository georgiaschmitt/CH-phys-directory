"use strict";

function initMap() {
    const usa = { lat: 39.8283, lng: -98.5795};
    const map = new google.maps.Map(document.getElementById("map"), {
        zoom: 3.5,
        center: usa,
    });
    
    const locationInfo = new google.maps.InfoWindow();

   
    // $('#state-search').on('submit', (evt) => {
    //   evt.preventDefault();
    
      const formData = {
        state: $('#state').val()
      };
    
      $.get('/api/searchresults', formData, (res) => {
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
    button.html("Bookmarked")

    $.post('/new-bookmark', formInputs, (res) => {
    });


  });