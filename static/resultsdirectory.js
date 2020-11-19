"use strict";

function initMap() {
    const usa = { lat: 39.8283, lng: -98.5795};
    const map = new google.maps.Map(document.getElementById("map"), {
        zoom: 3.5,
        center: usa,
    });
    
    const locationInfo = new google.maps.InfoWindow();

   
    
    document.querySelectorAll('.provider').forEach((el) => {
        const section = $(el);
        const locationInfoContent = (`
            <div class="window-content">
                ${section.data('locationId')}<br>
                <b>${section.data('name')}</b><br>
                ${section.data('institutionName')}<br>
                ${section.data('city')}, ${section.data('state')}<br>

                
            </div>
        `);
        const locationMarker = new google.maps.Marker({
            position: {
                lat: Number(section.data('lat')),
                lng: Number(section.data('lng'))
            },
            map:map,
        });

        locationMarker.addListener('click', () => {
            locationInfo.close();
            locationInfo.setContent(locationInfoContent);
            locationInfo.open(map, locationMarker);
        });
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

$('.clear-bookmarks').on('click', (evt) => {
    const button = $(evt.target);

    button.prop('disabled', true);
    button.html("All bookmarks cleared")

    $.post('/clear-bookmarks', (res) => {
    });
});