package models;

import java.util.ArrayList;
import java.util.List;

public class Timetable {
    public static List<Session> get() {
        List<Session> sessions = new ArrayList<Session>();
        sessions.add(makeSaturday());
        sessions.add(makeSunday());

        return sessions;
    }

    private static Session makeSaturday() {
        Session session = new Session("Saturday");

        session.events.add(new TimetableEvent("14:00", "Coding begins"));
        session.events.add(new TimetableEvent("17:30", "Hot pot served"));
        session.events.add(new TimetableEvent("18:00", "Bar opens"));
        session.events.add(new TimetableEvent("00:00", "Bar closes"));
        return session;
    }

    private static Session makeSunday() {
        Session session = new Session("Sunday");

        session.events.add(new TimetableEvent("01:00", "Trip to MacDonald's"));
        session.events.add(new TimetableEvent("09:00", "Breakfast is served"));
        session.events.add(new TimetableEvent("14:00", "Keyboards down"));
        return session;
    }
}
