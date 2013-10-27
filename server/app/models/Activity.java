package models;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import org.joda.time.DateTime;
import play.libs.WS;

public class Activity {
    public int numberOfCommits;
    public DateTime mostRecentCommit;

    public void update() {
//        GET /repos/:owner/:repo/events
//        https://api.github.com/repos/Markavian/HackManchester/events
        WS.HttpResponse result = WS.url("https://api.github.com/repos/Markavian/HackManchester/events").get();
        JsonElement contentJson = result.getJson();

        if (contentJson.isJsonArray()) {
            JsonArray jsonArray = contentJson.getAsJsonArray();
            numberOfCommits = jsonArray.size();

            for (JsonElement githubEventJson: jsonArray) {
                JsonObject gitHubEventObject = githubEventJson.getAsJsonObject();
                JsonElement createdAtElement = gitHubEventObject.get("created_at");
                String foo = createdAtElement.getAsString();

                System.out.println(foo);
                System.out.println(foo.length());

                DateTime dateTime = new DateTime(foo);

                if (mostRecentCommit == null) {
                    mostRecentCommit = dateTime;
                }
            }
        }
    }
}
