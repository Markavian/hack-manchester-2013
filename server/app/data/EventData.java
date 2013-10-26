package data;

import java.util.Calendar;
import java.util.GregorianCalendar;

public class EventData {
    public Calendar startTime;
    public Calendar endTime;

    public EventData() {
        this.startTime = new GregorianCalendar(2013, 10, 26, 14, 00);
        this.endTime = new GregorianCalendar(2013, 10, 27, 14, 00);
    }
}
