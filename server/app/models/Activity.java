package models;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import play.libs.WS;

public class Activity {
    public int numberOfCommits;

    public void update() {
//        GET /repos/:owner/:repo/events
//        https://api.github.com/repos/Markavian/HackManchester/events
        WS.WSRequest getRequest = WS.url("https://api.github.com/repos/Markavian/HackManchester/events");
        WS.HttpResponse result = getRequest.get();

        System.out.println(result.getStatus());
        System.out.println(result.getStatusText());
        JsonElement contentJson = result.getJson();

        if (contentJson.isJsonArray()) {
            JsonArray jsonArray = contentJson.getAsJsonArray();
            numberOfCommits = jsonArray.size();
        }
    }
}
