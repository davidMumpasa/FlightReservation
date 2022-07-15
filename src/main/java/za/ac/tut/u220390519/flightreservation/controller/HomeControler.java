package za.ac.tut.u220390519.flightreservation.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import za.ac.tut.u220390519.flightreservation.business.BusinessLogic;
import za.ac.tut.u220390519.flightreservation.model.Flight.Flight;
import za.ac.tut.u220390519.flightreservation.model.Flight.FlightService;
import za.ac.tut.u220390519.flightreservation.model.User.User;
import za.ac.tut.u220390519.flightreservation.model.User.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.Date;
import java.util.List;
import java.util.Optional;


@Controller
@RequestMapping("/home")
public class HomeControler {

    final
    FlightService flightService;
    final
    BusinessLogic businessLogic;

    final
    UserService userService;

    public HomeControler(FlightService flightService, BusinessLogic businessLogic, UserService userService) {
        this.flightService = flightService;
        this.businessLogic = businessLogic;
        this.userService = userService;
    }

    @GetMapping("")
    public ModelAndView getPage(){
        ModelAndView modelAndView = new ModelAndView();

        modelAndView.setViewName("home");

        return modelAndView;
    }

    @GetMapping("/login")
    public ModelAndView login(Model model, String error, String logout) {
        ModelAndView modelAndView =new ModelAndView();
        if (error != null)
            model.addAttribute("errorMsg", "Your username and password are invalid.");

        if (logout != null)
            model.addAttribute("msg", "You have been logged out successfully.");

        modelAndView.setViewName("login");

        return modelAndView;
    }

    @GetMapping("/Signing")
    public ModelAndView signIn(){
        ModelAndView modelAndView = new ModelAndView();

        modelAndView.setViewName("signin");

        return modelAndView;
    }

    @PostMapping("/addUser")
    public ModelAndView addUser(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();

        User user = businessLogic.createUser(request);
        userService.addUser(user);

        modelAndView.setViewName("Login");

        return modelAndView;
    }
    @GetMapping("/allFlight")
    public ModelAndView getFlights(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();

        HttpSession session = request.getSession(true);

        List<Flight> flightList = flightService.findAllFlight();
        session.setAttribute("flightList",flightList);

        modelAndView.setViewName("viewAllFlights");

        return modelAndView;
    }

    @PostMapping("/searchFlight")
    public ModelAndView searchFlight(HttpServletRequest request) throws ParseException {
        ModelAndView modelAndView = new ModelAndView();

        String fromCity = request.getParameter("fromCity");
        String toCity = request.getParameter("toCity");
        String flightDate = request.getParameter("flightDate");

        SimpleDateFormat inDate = new SimpleDateFormat("dd-MM-yyyy");

        HttpSession session = request.getSession();

        Flight SearchedFlight = flightService.searchFlight(fromCity,toCity,inDate.parse(flightDate));

        session.setAttribute("SearchedFlight",SearchedFlight);

        modelAndView.setViewName("searchFlight");

        return modelAndView;

    }


}
