<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Document</title>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Airline Booking ticket</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>



    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">

            <li class="nav-item">
                <a class="nav-link" href="/admin/">Home</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="/admin/manageFlights/">manage Flight</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="/admin/flightReport/">Flight report</a>
            </li>

        </ul>

    </div>
</nav>

<form action="/admin/addFlightDb/" method="post">
    <table>

        <tr>
            <td>flight Name:</td>
            <td><input class="form-control mr-sm-2" type="text" name="flightName"/></td>
        </tr>
        <tr>
            <td>From city:</td>
            <td><input class="form-control mr-sm-2" type="text" name="fromCity"/></td>
        </tr>

        <tr>
            <td>To city:</td>
            <td><input class="form-control mr-sm-2" type="text" name="toCity"/></td>
        </tr>
        <tr>
            <td>FLight Date:</td>
            <td><input class="form-control mr-sm-2" type="date" name="flightDate"></td>
        </tr>

        <tr>
            <td>FLight Time:</td>
            <td><input class="form-control mr-sm-2" type="time" name="flightTime"></td>
        </tr>

        <tr>
            <td>duration:</td>
            <td><input class="form-control mr-sm-2" type="text" name="duration"></td>
        </tr>

        <tr>
            <td>airport name:</td>
            <td><input class="form-control mr-sm-2" type="text" name="airport"></td>
        </tr>

        <tr>
            <td>ticket Price:</td>
            <td><input class="form-control mr-sm-2" type="text" name="ticketPrice"></td>
        </tr>

        <tr>
            <td>description:</td>
            <td><input class="form-control mr-sm-2" type="text" name="description"></td>
        </tr>

        <tr>
            <td></td>
            <td><input class="btn btn-outline-success my-2 my-sm-0" type="submit" value="Submit"/></td>
        </tr>
    </table>
</form>

</body>
</html>