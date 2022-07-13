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
import za.ac.tut.u220390519.flightreservation.model.User.User;
import za.ac.tut.u220390519.flightreservation.model.User.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;


@Controller
@RequestMapping("/home")
public class HomeControler {

    @Autowired
    FlightService flightService;
    @Autowired
    BusinessLogic businessLogic;

    @Autowired
    UserService userService;

    @GetMapping("")
    public ModelAndView getPage(){
        ModelAndView modelAndView = new ModelAndView();

        modelAndView.setViewName("home");

        return modelAndView;
    }

    @GetMapping("/Login")
    public ModelAndView login(){
        ModelAndView modelAndView = new ModelAndView();

        modelAndView.setViewName("Login");

        return modelAndView;
    }


    @GetMapping("/Signing")
    public ModelAndView signIn(){
        ModelAndView modelAndView = new ModelAndView();

        modelAndView.setViewName("signin");

        return modelAndView;
    }

    @PostMapping("/Signing")
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


}
