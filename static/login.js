"use strict";

$.get("/is_loggedin", (res) => {

    if (res === "True") {
        $('#loginstatus').html('Log out');
        $('#loginstatus').attr('href', '/logout');
        $('#bookmarks').show();
        // $('#user').append('You're logged in as {{ session['user_email'] }}');


    } else {
        $('#loginstatus').html('Sign in or create an account');
        $('#bookmarks').hide();
        $('#user').hide();
    }
    
});






