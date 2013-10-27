package controllers;

import models.Activity;
import play.mvc.Controller;

public class ActivityController extends Controller {

    public static void get() {
        Activity activity = new Activity();
        activity.update();
        renderJSON(activity);
    }
}
