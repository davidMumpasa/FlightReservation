<%@ page import="za.ac.tut.u220390519.flightreservation.model.Flight.Flight" %>
<%@ page import="java.util.Date" %>
<%@ page import="za.ac.tut.u220390519.flightreservation.model.User.User" %>
<%@ page import="za.ac.tut.u220390519.flightreservation.model.Booking.Booking" %>
<%@ page import="java.util.List" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
     <title>Document</title>
    <link rel="stylesheet" href="/css/home2.css">
    <link rel="stylesheet" href="/css/bookTicketDesign.css">

    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>
<body style="background-color: #0a192f">


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

        <table class="table1">
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

            <tbody >
                <tr class="column1">
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

        </table>

        <table class="payment">
            <form class="paymentForm" action="/user/makePayment/" method="post">
                <tr>
                    <td>Account holder name:</td>
                    <td><input required type="text" name="username"/></td>
                </tr>
                <tr>
                    <td>Card number:</td>
                    <td><input required type="text" name="cardNo"/></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input required type="text" name="email"/></td>
                </tr>
                <tr>
                    <td></td>
                    <%
                        List<Booking> bookings = (List<Booking>) session.getAttribute("bookings");


                            for (Booking Booking : bookings) {
                                Long bookingNo = Booking.getId();
                                Flight flight2 = Booking.getFlight();
                                Date bookingDate = Booking.getBookingDate();
                                User user = Booking.getUser();

                                if(flight2.equals(flight)){

                    %>
                    <script>
                        swal("You have already booked for this flight !");
                    </script>

                        <%
                            } else{

                        %>

                    <td><input class="btn1" type="submit" value="Make Payment"/></td>
                    <%
                            }
                        }
                    %>
                </tr>
            </form>
        </table>
    </div>

</body>
</html>