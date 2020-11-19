<?php
if($_POST["providerName"]) {
    mail("georgia.schmitt@gmail.com", "Form to email message", $_POST["providerName"], "From: an@email.address");
}
?>


{% extends 'base.html' %}

{% block title %}Suggest a Provider{% endblock %}

{% block body %}



    <form method="post" action="suggestion_form.php">
        <label>Your name:</label>
        <input type="text" name="sender"><br>

        <label>Email address:</label>
        <input type="text" name="senderEmail"><br>

        <label>Name of Provider:</label>
        <input type="text" name="providerName"><br>

        <label>Institution:</label>
        <input type="text" name="institution"><br>

        <label>City:</label>
        <input type="text" name="city"><br>

        <label>State:</label>
        <input type="text" name="state"><br><br>


        <input type="submit" name="submit">
    </form>



  <ul>
    <li><a href="/providers">Back to providers</a></li>
    </ul>
  
{% endblock %}