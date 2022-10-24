package za.ac.tut.u220390519.flightreservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import za.ac.tut.u220390519.flightreservation.business.BusinessLogic;
import za.ac.tut.u220390519.flightreservation.model.Booking.Booking;
import za.ac.tut.u220390519.flightreservation.model.Booking.BookingService;
import za.ac.tut.u220390519.flightreservation.model.Flight.Flight;
import za.ac.tut.u220390519.flightreservation.model.Flight.FlightService;
import za.ac.tut.u220390519.flightreservation.model.User.User;
import za.ac.tut.u220390519.flightreservation.model.User.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Optional;

@Controller
@RequestMapping("/user")
public class UserController {

    final
    FlightService flightService;
    final
    BusinessLogic businessLogic;

    final
    UserService userService;

    final
    BookingService bookingService;

    public UserController(FlightService flightService, BusinessLogic businessLogic, UserService userService, BookingService bookingService) {
        this.flightService = flightService;
        this.businessLogic = businessLogic;
        this.userService = userService;
        this.bookingService = bookingService;
    }

    @PostMapping("/bookTicket")
    public ModelAndView booking(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();

        HttpSession session = request.getSession();

        Long flightNo = Long.parseLong(request.getParameter("flightNo"));
        Optional<Flight> flightOptional = flightService.findFlight(flightNo);
        Flight flight = flightOptional.get();

        session.setAttribute("flight",flight);

        modelAndView.setViewName("bookTicket");

        return modelAndView;
    }

    @PostMapping("/makePayment")
    public ModelAndView makePayment(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();

        String username = request.getParameter("username");
        String cardNo = request.getParameter("cardNo");
        String email = request.getParameter("email");

       User user = userService.findUserByUserName(username);
       HttpSession session = request.getSession();

        Long id = bookingService.countBookings();
       Booking booking = businessLogic.createBooking(id,request,session,user);


       bookingService.addBooking(booking);

       session.setAttribute("booking",booking);

        modelAndView.setViewName("bookingSuccessfully");

        return modelAndView;
    }

}
