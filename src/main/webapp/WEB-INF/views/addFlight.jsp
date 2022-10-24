<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/css/home2.css">
    <link rel="stylesheet" href="/css/addFt.css">
    <title>Document</title>
</head>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>{
    function handleClick(){

        swal({
            title: "Good job!",
            text: "The flight was successfully added!",
            icon: "success",
        });
    }
}

</script>

<body style="background-color: #0a192f">

<div class="navbar">
    <h2>Flight Reservation</h2>

    <ul>
        <li>
            <a class="home" href="/admin/">Home</a>
        </li>
        <li>
            <a class="manageFgt" href="/admin/manageFlights/">manageFlight</a>
        </li>
        <li>
            <a class="Kitchen" href="/admin/flightReport/">Flight Report</a>
        </li>

    </ul>
</div>

<form action="/admin/addFlightDb/" method="post">
    <table class="tableLabels">

        <tr>
            <td>flight Name:</td>
            <td><input required class="btn2" type="text" name="flightName"/></td>
        </tr>
        <tr>
            <td>From city:</td>
            <td><input required class="btn3" type="text" name="fromCity"/></td>
        </tr>

        <tr>
            <td>To city:</td>
            <td><input required class="btn4" type="text" name="toCity"/></td>
        </tr>
        <tr>
            <td>FLight Date:</td>
            <td><input required class="btn5" type="date" name="flightDate"></td>
        </tr>

        <tr>
            <td>FLight Time:</td>
            <td><input required class="btn6" type="time" name="flightTime"></td>
        </tr>

        <tr>
            <td>duration:</td>
            <td><input required class="btn7" type="text" name="duration"></td>
        </tr>

        <tr>
            <td>airport name:</td>
            <td><input required class="btn8" type="text" name="airport"></td>
        </tr>

        <tr>
            <td>ticket Price:</td>
            <td><input required class="btn9" type="text" name="ticketPrice"></td>
        </tr>

        <tr>
            <td>description:</td>
            <td><input required class="btn10" type="text" name="description"></td>
        </tr>

        <tr>
            <td></td>
            <td><input class="btn1" type="submit" value="Submit" onclick="handleClick()"/></td>
        </tr>
    </table>
</form>

</body>
</html>