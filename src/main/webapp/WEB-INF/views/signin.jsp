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
                <a class="nav-link" href="/home/">Home</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="/home/allFlight/">Flight</a>
            </li>

        </ul>

    </div>
</nav>

<form action="/home/addUser/" method="post">
    <table>
        <tr>
            <td>id:</td>
            <td><input  class="form-control mr-sm-2" type="text" placeholder="User Id" aria-label="Search" name="userId"/></td>

        </tr>
        <tr>

            <td>First Name:</td>
            <td><input class="form-control mr-sm-2" type="text" placeholder="First Name" aria-label="Search" name="firstName"/></td>
        </tr>
        <tr>
            <td>last Name:</td>
            <td><input class="form-control mr-sm-2" type="text" placeholder="last Name" aria-label="Search" name="lastName"/></td>
        </tr>
        <tr>
            <td>email:</td>
            <td><input class="form-control mr-sm-2" type="text" placeholder="email" aria-label="Search" name="email"/></td>
        </tr>
        <tr>
            <td>Role:</td>
            <td><input class="form-control mr-sm-2" type="text" placeholder="Admin/User" aria-label="Search" name="role"/></td>
        </tr>
        <tr>
            <td>password:</td>
            <td><input class="form-control mr-sm-2" type="password" placeholder="password" aria-label="Search" name="password"/></td>
        </tr>
        <tr>
            <td></td>
            <td> <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Sign In</button></td>
        </tr>
    </table>
</form>
</body>
</html>