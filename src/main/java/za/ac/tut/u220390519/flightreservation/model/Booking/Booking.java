package za.ac.tut.u220390519.flightreservation.model.Booking;

import za.ac.tut.u220390519.flightreservation.model.Flight.Flight;
import za.ac.tut.u220390519.flightreservation.model.User.User;

import javax.persistence.*;
import java.util.Date;

@Entity
public class Booking {

    @Id
    private Long id;
    @OneToOne(cascade = CascadeType.PERSIST, fetch = FetchType.LAZY)
    private User user;
    private Date bookingDate;
    @OneToOne(cascade = CascadeType.PERSIST, fetch = FetchType.LAZY)
    private Flight flight;

    public Booking() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(Date bookingDate) {
        this.bookingDate = bookingDate;
    }

    public Flight getFlight() {
        return flight;
    }

    public void setFlight(Flight flight) {
        this.flight = flight;
    }
}
