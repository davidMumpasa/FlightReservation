package za.ac.tut.u220390519.flightreservation.model.Flight;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import za.ac.tut.u220390519.flightreservation.model.User.User;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

@Service
public class FlightService {
    @Autowired
    private FlightRepository flightRepository;

    public void addFlight(Flight flight){

        flightRepository.save(flight);
    }

    public Optional<Flight> findFlight(Long id){

        return flightRepository.findById(id);
    }

    public List<Flight> findAllFlight(){
        List<Flight> flights = new ArrayList<>();

        Iterator<Flight> flightIterable = flightRepository.findAll().iterator();

        while(flightIterable.hasNext()){
            Flight flight = flightIterable.next();
            flights.add(flight);
        }

        return flights;
    }

    public void deleteFlight(Flight flight){
        flightRepository.delete(flight);
    }
}
