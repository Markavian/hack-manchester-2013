package models;

import java.util.ArrayList;
import java.util.List;

public class Session {
    public String day;
    public List<TimetableEvent> events;

    public Session(String day) {
        this.day = day;
        this.events = new ArrayList<TimetableEvent>();
    }
}
