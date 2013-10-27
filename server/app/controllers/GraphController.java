package controllers;

import data.EventData;
import models.Event;
import models.Graph;
import play.mvc.Controller;
import services.DateTimeToStringConvertor;

import java.text.MessageFormat;

public class GraphController extends Controller {

    public static void get() {
        renderText(new Graph().graph);
    }
}
