package za.ac.tut.u220390519.flightreservation.model.Flight;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FlightRepository extends CrudRepository<Flight,Long> {
}
