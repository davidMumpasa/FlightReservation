package za.ac.tut.u220390519.flightreservation.model.Flight;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import java.sql.Time;
import java.util.Date;

@Entity
public class Flight {

    @Id
    private Long flightNo;
    private String name;
    private String fromCity;
    private String toCity;
    @Temporal(value=TemporalType.DATE)
    private Date flightDate;
    @Temporal(value = TemporalType.TIME)
    private Date time;
    private Integer duration;
    private String airport;
    private Integer ticketPrice;
    private String description;

    public Flight() {
    }

    public Long getFlightNo() {
        return flightNo;
    }

    public void setFlightNo(Long flightNo) {
        this.flightNo = flightNo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFromCity() {
        return fromCity;
    }

    public void setFromCity(String fromCity) {
        this.fromCity = fromCity;
    }

    public String getToCity() {
        return toCity;
    }

    public void setToCity(String toCity) {
        this.toCity = toCity;
    }

    public Date getFlightDate() {
        return flightDate;
    }

    public void setFlightDate(Date flightDate) {
        this.flightDate = flightDate;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getDuration() {
        return duration;
    }

    public void setDuration(Integer duration) {
        this.duration = duration;
    }

    public String getAirport() {
        return airport;
    }

    public void setAirport(String airport) {
        this.airport = airport;
    }

    public Integer getTicketPrice() {
        return ticketPrice;
    }

    public void setTicketPrice(Integer ticketPrice) {
        this.ticketPrice = ticketPrice;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
