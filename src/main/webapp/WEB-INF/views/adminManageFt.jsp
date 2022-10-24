<%@ page import="za.ac.tut.u220390519.flightreservation.model.Flight.Flight" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/flights.css">
    <link rel="stylesheet" href="/css/home2.css">
    <title>Document</title>

    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <script>{
        function handleClick(flightNo){

            swal({
                title: "Are you sure?",
                text: "Once deleted, you will not be able to recover !",
                icon: "warning",
                buttons: true,
                dangerMode: true,
            })
                .then((willDelete) => {
                    if (willDelete) {
                        axios.post("http://localhost:8081/admin/deleteFlight/").then(() =>{
                            swal("Flight deleted successfully !", {
                                icon: "success",
                            });
                        })

                    } else {

                    }
                });
        }
    }


    </script>


</head>
<body>
<div class="adminManageFt">

    <div class="navbar">
        <h2>Flight Reservation</h2>

        <ul>
            <li>
                <a class="home" href="/admin/">Home</a>
            </li>

            <li>
                <a class="Kitchen" href="/admin/flightReport/">Flight Report</a>
            </li>
            <li>
                <a class="Backyard" href="/admin/addFlight/">Add flight</a>
            </li>
        </ul>
    </div>

    <table>

        <div class="searchBtn">
        <label> search :</label> <input class="search" placeholder="search" type="search" name="search"  />
        </div>

        <tr>
            <th>No</th>
            <th >Flight Name</th>
            <th >From City</th>
            <th >To City</th>
            <th >Flight Date</th>
            <th >Flight Time</th>
            <th >Duration</th>
            <th>Airport</th>
            <th >Ticket Price</th>
            <th >Description</th>
            <th>Action</th>
            <th> </th>


        </tr>

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

                        <%
                          session.setAttribute("flightNo",flightNo);

                        %>

                    <td>
                        <input class="deleteBtn"type="submit" value="Delete" onclick="handleClick(<%=flightNo%>)"/>
                    </td>


                <form action="/admin/editFlight/" method="GET">
                    <input type="hidden" value="<%=flightNo%>" name="edFlight">
                    <td><input class="edit" type="submit" value="Edit"/></td>
                </form>

        <%
            }
        %>
    </table>
</div>
</body>
</html>