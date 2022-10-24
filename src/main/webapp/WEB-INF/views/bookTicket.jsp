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
     <title>Document</title>
    <link rel="stylesheet" href="/css/home2.css">
    <link rel="stylesheet" href="/css/flights.css">
</head>
<body>


<div class="navbar">
    <h2>Flight Reservation</h2>

    <ul>
        <li>
            <a class="home" href="/home/">Home</a>
        </li>

        <li>
            <a class="Kitchen" href="/home/allFlight/">View All Flights</a>
        </li>

    </ul>
</div>

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

            <tbody class="payment">
                <tr>
                    <td><%=flightNo%></td>
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