package controllers;

import models.Activity;
import play.mvc.Controller;
import services.DateTimeToStringConvertor;

import java.text.MessageFormat;

public class ActivityController extends Controller {

    public static void get() {
        Activity activity = new Activity("Markavian", "HackManchester");
        activity.update();

        String jsonString = MessageFormat.format(
                "'{'\"{0}\": \"{1}\", \"{2}\": \"{3}\", \"{4}\": \"{5}\", \"{6}\": \"{7}\", \"{8}\": \"{9}\"'}'",
                "numberOfCommits", activity.numberOfCommits,
                "mostRecentCommit", DateTimeToStringConvertor.getDateTimeAsHaxeCompatibleString(activity.mostRecentCommit),
                "numberOfCommitsInLastHour", activity.numberOfCommitsInLastHour,
                "numberOfCommitsInLastThreeHours", activity.numberOfCommitsInLastThreeHours,
                "numberOfCommitsSinceStartOfEvent", activity.numberOfCommitsSinceStartOfEvent);
        renderJSON(jsonString);
    }
}
