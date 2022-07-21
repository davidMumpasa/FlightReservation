package za.ac.tut.u220390519.flightreservation.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import za.ac.tut.u220390519.flightreservation.business.BusinessLogic;
import za.ac.tut.u220390519.flightreservation.model.Booking.Booking;
import za.ac.tut.u220390519.flightreservation.model.Booking.BookingService;
import za.ac.tut.u220390519.flightreservation.model.Flight.Flight;
import za.ac.tut.u220390519.flightreservation.model.Flight.FlightService;
import za.ac.tut.u220390519.flightreservation.model.User.UserService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;


@Controller
@RequestMapping("/admin")
public class adminControler {

    final
    BusinessLogic businessLogic;
    final
    FlightService flightService;
    final
    UserService userService;

    final
    BookingService bookingService;

    public adminControler(BusinessLogic businessLogic, FlightService flightService, UserService userService,BookingService bookingService) {
        this.businessLogic = businessLogic;
        this.flightService = flightService;
        this.userService = userService;
        this.bookingService = bookingService;
    }

    @GetMapping("")
    public ModelAndView adminDashBoard(){
        ModelAndView modelAndView = new ModelAndView();

        modelAndView.setViewName("adminDb");

        return modelAndView;
    }

    @GetMapping("/addFlight")
    public ModelAndView addFlight(){
        ModelAndView modelAndView = new ModelAndView();

        modelAndView.setViewName("addFlight");

        return modelAndView;
    }



    @PostMapping("/addFlightDb")
    public ModelAndView addFlightDb(HttpServletRequest request) throws ParseException {
        ModelAndView modelAndView = new ModelAndView();

        Long numberOfFlight = flightService.countFlights();
        Flight flight = businessLogic.setFlight(request,numberOfFlight);
        flightService.addFlight(flight);

        modelAndView.setViewName("adminDb");

        return modelAndView;
    }

    @GetMapping("/flightReport")
    public ModelAndView flightReport(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();

        HttpSession session = request.getSession();
        List<Booking> bookings = bookingService.findAllBookings();
        session.setAttribute("bookings",bookings);

        modelAndView.setViewName("flightReport");

        return modelAndView;
    }

    @GetMapping("/manageFlights")
    public ModelAndView manageFlights(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();

        HttpSession session = request.getSession();

        List<Flight> adminManageFlightList = flightService.findAllFlight();
        session.setAttribute("adminManageFlightList",adminManageFlightList);

        modelAndView.setViewName("adminManageFights");

        return modelAndView;
    }

    @GetMapping("/editFlight")
    public ModelAndView editFlights(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();

        HttpSession session = request.getSession();

        modelAndView.setViewName("editFlight");

        return modelAndView;
    }

    @PostMapping("/editFlight")
    public ModelAndView editFlightsDB(HttpServletRequest request) throws ParseException {
        ModelAndView modelAndView = new ModelAndView();

        HttpSession session = request.getSession();

        Long numberOfFlight = flightService.countFlights();
        Flight editedFlight = businessLogic.setFlight(request,numberOfFlight);

        flightService.addFlight(editedFlight);

        session.setAttribute("editedFlight",editedFlight);

        modelAndView.setViewName("flightSuccessfullyEdited");

        return modelAndView;
    }

    @PostMapping("/deleteFlight")
    public ModelAndView deleteFlights(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();

        HttpSession session = request.getSession();

        Long flightNo =  Long.parseLong(request.getParameter("flightNo"));

        List<Booking> bookings = bookingService.findAllBookings();

        for(Booking booking:bookings){

            Flight bookingFlight = booking.getFlight();
            Optional<Flight> flight = flightService.findFlight(flightNo);

            if(bookingFlight.getFlightNo() == flightNo){

                bookingService.deleteBooking(booking);

                flightService.deleteFlight(flight.get());

            } else{
                flightService.deleteFlight(flight.get());
            }
        }

        List<Flight> adminManageFlightList = flightService.findAllFlight();
        session.setAttribute("adminManageFlightList",adminManageFlightList);

        modelAndView.setViewName("deleteFlight");

        return modelAndView;
    }

}
