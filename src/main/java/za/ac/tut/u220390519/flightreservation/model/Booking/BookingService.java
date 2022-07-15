package za.ac.tut.u220390519.flightreservation.model.Booking;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import za.ac.tut.u220390519.flightreservation.model.Flight.Flight;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

@Service
public class BookingService {

    private final BookingRepository bookingRepository;

    public BookingService(BookingRepository bookingRepository) {
        this.bookingRepository = bookingRepository;
    }

    public void addBooking(Booking booking){
        bookingRepository.save(booking);
    }

    public Optional<Booking> findBooking(Long id){

       return bookingRepository.findById(id);

    }

    public List<Booking> findAllBookings(){
        List<Booking> bookings = new ArrayList<>();
        Iterator bookingIterator = bookingRepository.findAll().iterator();

        while(bookingIterator.hasNext()){
            Booking booking = (Booking) bookingIterator.next();
            bookings.add(booking);
        }

        return bookings;
    }

    public void deleteBooking(Booking booking){
        bookingRepository.delete(booking);

    }

    public Long countBookings(){
        return bookingRepository.count();
    }

}
