package za.ac.tut.u220390519.flightreservation.model.Flight;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.Optional;

@Repository
public interface FlightRepository extends JpaRepository<Flight,Long> {

    Optional<Flight> findByFromCity(String fromCity);
    Optional<Flight> findByToCity(String toCity);
    Optional<Flight> findByFlightDate(Date flightDate);

}
