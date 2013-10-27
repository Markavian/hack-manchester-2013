package data;

import org.joda.time.DateTime;

public class EventData {
    public DateTime startTime;
    public DateTime endTime;

    public EventData() {
        this.startTime = new DateTime(2013, 10, 26, 14, 00);
        this.endTime = new DateTime(2013, 10, 27, 14, 00);
    }
}
