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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Document</title>
</head>
<body>



<div class="container-fluid">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">

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

            <form class="form-inline my-2 my-lg-0" action="/home/searchFlight/" method="post">

                <li class="nav-item active">
                    <input class="form-control mr-sm-2" type="search" placeholder="From city" name="fromCity" aria-label="Search">
                </li>

                <li class="nav-item">
                    <input class="form-control mr-sm-2" type="search" placeholder="To city" name="toCity" aria-label="Search">
                </li>

                <input class="form-control mr-sm-2" type="Date" placeholder="Date" name="flightDate" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </nav>


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
            </tr>
            </thead>

            <%
                List<Flight> flightList = (List<Flight>) session.getAttribute("adminManageFlightList");

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

            <form action="/admin/editFlight/" method="post">
                <tr id="requests">
                    <th scope="row"><%=flightNo%></th>
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

                    <td><input size="5px" type="submit" class="btn btn-success" value="Edit"></td>
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