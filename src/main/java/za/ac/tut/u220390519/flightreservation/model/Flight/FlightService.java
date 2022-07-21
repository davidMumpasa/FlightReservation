package za.ac.tut.u220390519.flightreservation.model.Flight;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class FlightService {
   private final FlightRepository flightRepository;

    public FlightService(FlightRepository flightRepository) {
        this.flightRepository = flightRepository;
    }

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

    public Flight searchFlight(String fromCity, String toCity, Date flightDate){

        Optional<Flight> flight1 = flightRepository.findByFromCity(fromCity);
        Optional<Flight> flight2 = flightRepository.findByToCity(toCity);
        Optional<Flight> flight3 = flightRepository.findByFlightDate(flightDate);
        Flight flight = new Flight();

        if((flight1.get().getName().equals (flight2.get().getName())) && flight1.get().getName().equals (flight3.get().getName())){
              flight = flight1.get();
        }

        return flight;
    }

    public Long countFlights(){

        Long numberOfFlight = flightRepository.count();

        return numberOfFlight;
    }
}
