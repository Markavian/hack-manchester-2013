package controllers;

import models.Activity;
import play.mvc.Controller;
import services.DateTimeToStringConvertor;

import java.text.MessageFormat;

public class ActivityController extends Controller {

    public static void get() {
        Activity activity = new Activity();
        activity.update();

        String jsonString = MessageFormat.format("'{'\"numberOfCommits\": \"{0}\", \"mostRecentCommit\": \"{1}\"'}'",
                activity.numberOfCommits,
                DateTimeToStringConvertor.getDateTimeAsHaxeCompatibleString(activity.mostRecentCommit));
        renderJSON(jsonString);
    }
}
