package models;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import data.NewsItem;
import org.apache.commons.codec.binary.Base64;
import play.libs.WS;

import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;

public class News {
    static private final String CONSUMER_KEY = "wsewp05A7bh5BjpD7SPUQ";
    static private final String CONSUMER_SECRET = "aRvcRE6NxvwRjjIj8HqYD0e6WGBValidBIVdEzn4Tx4";

    public String account;
    public List<NewsItem> newsItems;

    public News(String account) {
        account = "@" + account;
    }

    public void update() {
        String bearerKey = authenticateAndGetBearerKey();

        if (bearerKey != null) {
            getTwitterEntriesFor(bearerKey);
        }
    }

    private List<NewsItem> getTwitterEntriesFor(String bearerKey) {
        newsItems = new ArrayList<NewsItem>();

        WS.WSRequest getRequest = WS.url("https://api.twitter.com/1.1/search/tweets.json?src=typd&q=%23hackmanchester");
        getRequest.setHeader("Authorization", "Bearer " + bearerKey);
        WS.HttpResponse result = getRequest.get();

//        System.out.println("Result of twitter search:");
//        System.out.println(result.getStatusText());

        JsonElement contentJson = result.getJson();
        if (contentJson.isJsonObject()) {
            JsonElement statusesElement = contentJson.getAsJsonObject().get("statuses");

            JsonArray statusesArray = statusesElement.getAsJsonArray();
            for (JsonElement element: statusesArray) {
                JsonObject jsonObject = element.getAsJsonObject();

                newsItems.add(new NewsItem(jsonObject.get("created_at").toString(), jsonObject.get("text").toString()));
            }
        }

        return newsItems;
    }

    private String authenticateAndGetBearerKey() {
        String consumerKeyAndSecret = MessageFormat.format("{0}:{1}", CONSUMER_KEY, CONSUMER_SECRET);

        byte[] keyAndSecretAsBytes = Base64.encodeBase64(consumerKeyAndSecret.getBytes());
        String keyAndSecret = new String(keyAndSecretAsBytes);

        WS.WSRequest postRequest = WS.url("https://api.twitter.com/oauth2/token");
        postRequest.setHeader("Authorization", "Basic " + keyAndSecret);
        postRequest.setHeader("ContentType", "application/x-www-form-urlencoded;charset=UTF-8");
        postRequest.setParameter("grant_type", "client_credentials");

        WS.HttpResponse result = postRequest.post();
//
//        System.out.println("Result of requesting bearer token:");
//        System.out.println(result.getStatusText());
//        System.out.println(result.getStatus());
//        System.out.println(result.getJson());

        JsonElement contentJson = result.getJson();
        if (contentJson.isJsonObject()) {
            JsonElement accessToken = contentJson.getAsJsonObject().get("access_token");
            return accessToken.getAsString();
        }

        return null;
    }
}
