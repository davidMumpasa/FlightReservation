<%@ page import="za.ac.tut.u220390519.flightreservation.model.Flight.Flight" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/css/home2.css">
    <link rel="stylesheet" href="/css/editFt.css">
     <title>Document</title>
</head>
<body style="background-color: #0a192f">

<div class="container-fluid">
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
            <li>
                <a class="Backyard" href="/admin/addFlight/">Add flight</a>
            </li>
        </ul>
    </div>


    <div>
        <table id="dataTable" class="table">
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
                <th scope="col"></th>
            </tr>
            </thead>

            <%
                 Flight flight = (Flight) session.getAttribute("edFlight");

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

            <tbody>

            <form action="/admin/editFlight/" method="post">
                <tr id="requests">
                    <td scope="row"><%=flightNo%></td>
                    <td><input size="10px" type="text" value="<%=flightName%>" name="flightName"/></td>
                    <td><input size="10px" type="text" value="<%=fromCity%>" name="fromCity"/></td>
                    <td><input size="10px" type="text" value="<%=toCity%>" name="toCity"/></td>
                    <td><input size="10px" type="date" value="<%=flightDate%>"  name="flightDate"/></td>
                    <td><input size="10px" type="time" value="<%=flightTime%>" name="flightTime"/></td>
                    <td><input size="1%" type="text" value="<%=duration%>" name="duration"/></td>
                    <td><input size="10px" type="text" value="<%=airport%>" name="airport"/></td>
                    <td><input size="2px" type="text" value="<%=ticketPrice%>" name="ticketPrice"/></td>
                    <td><input size="10px" type="text" value="<%=description%>" name="description"/></td>
                    <input size="10px" type="hidden" value="<%=flightNo%>" name="flightNo" >
                    <input type="hidden" name="<%=flightNo%>"/>
                    <td><input class="edit" size="5px" type="submit" class="btn btn-success" value="Edit"></td>
                </tr>
            </form>


            </tbody>
        </table>
    </div>
</div>

</body>
</html>