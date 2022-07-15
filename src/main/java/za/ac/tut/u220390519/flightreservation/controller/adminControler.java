package za.ac.tut.u220390519.flightreservation.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import za.ac.tut.u220390519.flightreservation.business.BusinessLogic;
import za.ac.tut.u220390519.flightreservation.model.Flight.Flight;
import za.ac.tut.u220390519.flightreservation.model.Flight.FlightService;
import za.ac.tut.u220390519.flightreservation.model.User.UserService;
import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;


@Controller
@RequestMapping("/admin")
public class adminControler {

    final
    BusinessLogic businessLogic;
    final
    FlightService flightService;
    final
    UserService userService;

    public adminControler(BusinessLogic businessLogic, FlightService flightService, UserService userService) {
        this.businessLogic = businessLogic;
        this.flightService = flightService;
        this.userService = userService;
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

        Flight flight = businessLogic.setFlight(request);
        flightService.addFlight(flight);

        modelAndView.setViewName("adminDb");

        return modelAndView;
    }

}
