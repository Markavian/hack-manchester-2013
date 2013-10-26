package controllers;

import data.EventData;
import models.Event;
import play.mvc.*;

import java.text.DateFormat;
import java.text.MessageFormat;
import java.text.SimpleDateFormat;
import java.util.*;

public class EventController extends Controller {

    public static void get() {
        EventData eventData = Event.getEvent();

        String jsonString = MessageFormat.format("'{'\"startTime\": \"{0}\", \"endTime\": \"{1}\"'}'",
                getDateTimeAsIsoString(eventData.startTime),
                getDateTimeAsIsoString(eventData.endTime));
        renderJSON(jsonString);
    }

    private static String getDateTimeAsIsoString(Calendar dateTime) {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm'Z'");
        df.setTimeZone(TimeZone.getTimeZone("UTC"));
        return df.format(dateTime.getTime());
    }
}
