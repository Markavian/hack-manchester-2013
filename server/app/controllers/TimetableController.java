package controllers;

import data.EventData;
import models.*;
import play.mvc.Controller;

import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;

public class TimetableController extends Controller {

    public static void get() {

        List<Session> sessions = Timetable.get();
        renderJSON(sessions);
    }

}
