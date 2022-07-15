<%@ page import="za.ac.tut.u220390519.flightreservation.model.Flight.Flight" %>
<%@ page import="java.util.Date" %>
<%@ page import="za.ac.tut.u220390519.flightreservation.model.User.User" %>
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
                <a class="nav-link" href="/home">Home</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="/home/allFlight/">Flight</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="/home/Signing/">Login</a>
            </li>

        </ul>

    </div>
</nav>

    <div>

        <%
            Flight flight = (Flight) session.getAttribute("flight");



            Long flightNo = flight.getFlightNo();
            String flightName = flight.getName();
            String fromCity = flight.getFromCity();
            String toCity = flight.getToCity();
            Date flightDate = flight.getFlightDate();
            Date flightTime = flight.getTime();
            Integer duration = flight.getDuration();
            String airport = flight.getAirport();
            Integer ticketPrice = flight.getTicketPrice();
            String description = flight.getDescription();

        %>

        <table class="table">
            <thead class="thead-light">
            <tr>
                <th scope="col">No</th>
                <th scope="col">Flight Name</th>
                <th scope="col">From City</th>
                <th scope="col">To City</th>
                <th scope="col">Flight Date</th>
                <th scope="col">Flight Time</th>
                <th scope="col">Duration</th>
                <th scope="col">Airport</th>
                <th scope="col">Ticket Price</th>
                <th scope="col">Description</th>
            </tr>
            </thead>

            <tbody>
                <tr>
                    <th scope="row"><%=flightNo%></th>
                    <td><%=flightName%></td>
                    <td><%=fromCity%></td>
                    <td><%=toCity%></td>
                    <td><%=flightDate%></td>
                    <td><%=flightTime%></td>
                    <td><%=duration%></td>
                    <td><%=airport%></td>
                    <td><%=ticketPrice%></td>
                    <td><%=description%></td>
                </tr>

            </tbody>

            <form action="/user/makePayment/" method="post">
                <tr>
                    <td>Account holder name:</td>
                    <td><input type="text" name="username"/></td>
                </tr>
                <tr>
                    <td>Card number:</td>
                    <td><input type="text" name="cardNo"/></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input type="text" name="email"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit"  class="btn btn-success" value="Make Payment"/></td>
                </tr>
            </form>

        </table>
    </div>

</body>
</html>