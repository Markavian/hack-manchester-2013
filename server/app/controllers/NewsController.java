package controllers;

import models.News;
import play.mvc.Controller;

public class NewsController extends Controller {

    public static void get() {
        News news = new News("HackManchester");
        news.update();
        renderJSON(news);
    }

}
