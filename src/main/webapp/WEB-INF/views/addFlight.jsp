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
<form action="/admin/addFlightDb/" method="post">
    <table>
        <tr>
            <td>flight Number:</td>
            <td><input type="text" name="flightNo"/></td>
        </tr>
        <tr>

            <td>flight Name:</td>
            <td><input type="text" name="flightName"/></td>
        </tr>
        <tr>
            <td>From city:</td>
            <td><input type="text" name="fromCity"/></td>
        </tr>

        <tr>
            <td>To city:</td>
            <td><input type="text" name="toCity"/></td>
        </tr>
        <tr>
            <td>FLight Date:</td>
            <td><input type="date" name="flightDate"></td>
        </tr>

        <tr>
            <td>FLight Time:</td>
            <td><input type="time" name="flightTime"></td>
        </tr>

        <tr>
            <td>duration:</td>
            <td><input type="text" name="duration"></td>
        </tr>

        <tr>
            <td>airport name:</td>
            <td><input type="text" name="airport"></td>
        </tr>

        <tr>
            <td>ticket Price:</td>
            <td><input type="text" name="ticketPrice"></td>
        </tr>

        <tr>
            <td>description:</td>
            <td><input type="text" name="description"></td>
        </tr>

        <tr>
            <td></td>
            <td><input type="submit" value="Submit"/></td>
        </tr>
    </table>
</form>

</body>
</html>