package za.ac.tut.u220390519.flightreservation.controller;

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
import java.util.List;
import java.util.Optional;


@Controller
@RequestMapping("/admin")
public class adminController {

    final
    BusinessLogic businessLogic;
    final
    FlightService flightService;
    final
    UserService userService;

    final
    BookingService bookingService;

    public adminController(BusinessLogic businessLogic, FlightService flightService, UserService userService, BookingService bookingService) {
        this.businessLogic = businessLogic;
        this.flightService = flightService;
        this.userService = userService;
        this.bookingService = bookingService;
    }

    @GetMapping("")
    public ModelAndView adminDashBoard(){
        ModelAndView modelAndView = new ModelAndView();

        modelAndView.setViewName("adminHome");

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

        modelAndView.setViewName("addFlight");

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

        modelAndView.setViewName("adminManageFt");

        return modelAndView;
    }

    @GetMapping("/editFlight")
    public ModelAndView editFlights(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();

        Long flightId = Long.parseLong(request.getParameter("edFlight"));
        System.out.println("id is : "+flightId);
        Optional<Flight> optionalFlight = flightService.findFlight(flightId);
        Flight edFlight = optionalFlight.get();

        HttpSession session = request.getSession();

        session.setAttribute("edFlight",edFlight);

        modelAndView.setViewName("editFlight");

        return modelAndView;
    }

    @PostMapping("/editFlight")
    public ModelAndView editFlightsDB(HttpServletRequest request) throws ParseException {
        ModelAndView modelAndView = new ModelAndView();

        HttpSession session = request.getSession();

        Flight flight = (Flight) session.getAttribute("edFlight");

        Flight editedFlight = businessLogic.editFlight(request,flight);

        flightService.addFlight(editedFlight);

        session.setAttribute("editedFlight",editedFlight);

        modelAndView.setViewName("adminManageFt");

        return modelAndView;
    }

    @PostMapping("/deleteFlight")
    public ModelAndView deleteFlights(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();

        HttpSession session = request.getSession();

        String temp = session.getAttribute("flightNo").toString();
        System.out.println("Flight  id is "+ temp);

        long flightNo =  Long.parseLong(temp);
        System.out.println("Flight  id is "+ flightNo);

        List<Booking> bookings = bookingService.findAllBookings();
        Optional<Flight> flight = flightService.findFlight(flightNo);

        if (bookings.isEmpty()){
            flightService.deleteFlight(flight.get());

        } else{

            for(Booking booking:bookings){

                Flight bookingFlight = booking.getFlight();


                if(bookingFlight.getFlightNo() == flightNo){

                    bookingService.deleteBooking(booking);

                    flightService.deleteFlight(flight.get());


                } else{
                    flightService.deleteFlight(flight.get());

                }
            }
        }



        List<Flight> adminManageFlightList = flightService.findAllFlight();
        session.setAttribute("adminManageFlightList",adminManageFlightList);

        modelAndView.setViewName("adminManageFt");


        return modelAndView;
    }

}
