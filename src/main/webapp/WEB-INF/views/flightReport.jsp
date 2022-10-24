<%@ page import="za.ac.tut.u220390519.flightreservation.model.Flight.Flight" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="za.ac.tut.u220390519.flightreservation.model.Booking.Booking" %>
<%@ page import="za.ac.tut.u220390519.flightreservation.model.User.User" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/css/home2.css">
    <link rel="stylesheet" href="/css/ftReport.css">
    <title>Document</title>
</head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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
            <a class="Backyard" href="/admin/addFlight/">Add flight</a>
        </li>
    </ul>
</div>

        <table class="table">

            <%
                List<Booking> bookings = (List<Booking>) session.getAttribute("bookings");

                if(bookings.isEmpty()){
                %>
                <script>
                    swal("No bookings have been made !","Please come Back later");
                </script>
                <%
                }else{

                for (Booking Booking : bookings) {
                    Long bookingNo = Booking.getId();
                    Flight flight = Booking.getFlight();
                    Date bookingDate = Booking.getBookingDate();
                    User user = Booking.getUser();

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

                    Long userId = user.getId();
                    String role = user.getRole();
                    String username = user.getUsername();
                    String lastName = user.getLastName();
                    String email = user.getEmail();

            %>

            <thead class="thead-light">
            <tr>
                <th scope="col">No</th>
                <th scope="col">Booking Date</th>
                <th scope="col">Flight No</th>
                <th scope="col">Flight Name</th>
                <th scope="col">From City</th>
                <th scope="col">To City</th>
                <th scope="col">Flight Date</th>
                <th scope="col">Flight Time</th>
                <th scope="col">Duration</th>
                <th scope="col">Airport</th>
                <th scope="col">Ticket Price</th>
                <th scope="col">Description</th>
                <th scope="col">User Id</th>
                <th scope="col">User Name</th>
            </tr>
            </thead>

            <tbody>

            <tr>
                <td scope="row"><%=bookingNo%></td>
                <td><%=bookingDate%>
                <td><%=flightNo%>
                <td><%=flightName%></td>
                <td><%=fromCity%></td>
                <td><%=toCity%></td>
                <td><%=flightDate%></td>
                <td><%=flightTime%></td>
                <td><%=duration%></td>
                <td><%=airport%></td>
                <td><%=ticketPrice%></td>
                <td><%=description%></td>
                <td><%=userId%>
                <td><%=username%>

            </tr>

            </tbody>


            <%
                    }
                }
            %>
        </table>
    </div>
</div>


</body>
</html>