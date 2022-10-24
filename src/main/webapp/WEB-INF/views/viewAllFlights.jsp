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
     <title>Document</title>
    <link rel="stylesheet" href="/css/flights.css">
    <link rel="stylesheet" href="/css/home2.css">
</head>
<body>



<div class="container-fluid">
    <div class="navbar">
        <h2>Flight Reservation</h2>

        <ul>
            <li>
                <a class="home" href="/home/">Home</a>
            </li>
            <li>

            </li>
            <li>

            </li>

        </ul>
    </div>


    <div>
        <table class="table">
            <div class="searchBtn">
                <label> search :</label> <input class="search" placeholder="search" type="search" name="search"  />
            </div>

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
                List<Flight> flightList = (List<Flight>) session.getAttribute("flightList");

                for(Flight flight:flightList){
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

            <form action="/user/bookTicket/" method="post">
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
                    <input type="hidden" value="<%=flightNo%>" name="flightNo">
                    <td><input class="edit" type="submit" value="Book"></td>

                </tr>
            </form>


            </tbody>


            <%
                }
            %>
        </table>
    </div>
</div>



</body>
</html>