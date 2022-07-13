package za.ac.tut.u220390519.flightreservation.business;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import za.ac.tut.u220390519.flightreservation.model.Flight.Flight;
import za.ac.tut.u220390519.flightreservation.model.User.User;
import za.ac.tut.u220390519.flightreservation.model.User.UserService;

import javax.servlet.http.HttpServletRequest;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Optional;

@Service
public class BusinessLogic {

    public User createUser(HttpServletRequest request){
        String role = request.getParameter("role");
        Long userId = Long.parseLong(request.getParameter("userId"));
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = new User();

        user.setId(userId);
        user.setRole(role);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setPassword(password);
        user.setCreationDate(new Date());

        return user;

    }

    public Flight setFlight(HttpServletRequest request) throws ParseException {

        Long flightNo = Long.parseLong(request.getParameter("flightNo"));
        String flightName = request.getParameter("flightName");
        String fromCity = request.getParameter("fromCity");
        String toCity = request.getParameter("toCity");
        String flightDate = request.getParameter("flightDate");
        //Long flightTime = Date.parse(request.getParameter("flightTime"));
        Integer duration = Integer.parseInt(request.getParameter("duration"));
        String airport = request.getParameter("airport");
        Integer ticketPrice = Integer.parseInt(request.getParameter("ticketPrice"));
        String description = request.getParameter("description");


        Flight flight = new Flight();

        SimpleDateFormat inDate = new SimpleDateFormat("yyyy-MM-dd");
        Date flightTime = (new SimpleDateFormat("HH:mm")).parse(request.getParameter("flightTime"));


        flight.setFlightNo(flightNo);
        flight.setName(flightName);
        flight.setFromCity(fromCity);
        flight.setToCity(toCity);
        flight.setFlightDate(inDate.parse(flightDate));
        flight.setTime(flightTime);
        flight.setDuration(duration);
        flight.setAirport(airport);
        flight.setTicketPrice(ticketPrice);
        flight.setDescription(description);

        return flight;

    }


}
