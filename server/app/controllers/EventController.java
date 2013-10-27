package controllers;

import data.EventData;
import models.Event;
import play.mvc.Controller;
import services.DateTimeToStringConvertor;

import java.text.MessageFormat;

public class EventController extends Controller {

    public static void get() {
        EventData eventData = Event.getEvent();

        String jsonString = MessageFormat.format("'{'\"startTime\": \"{0}\", \"endTime\": \"{1}\"'}'",
                DateTimeToStringConvertor.getDateTimeAsHaxeCompatibleString(eventData.startTime),
                DateTimeToStringConvertor.getDateTimeAsHaxeCompatibleString(eventData.endTime));
        renderJSON(jsonString);
    }
}
