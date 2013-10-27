package models;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import data.NewsItem;
import org.apache.commons.codec.binary.Base64;
import play.libs.WS;

import java.net.URLEncoder;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;

public class News {
    static private final String CONSUMER_KEY = "wsewp05A7bh5BjpD7SPUQ";
    static private final String CONSUMER_SECRET = "aRvcRE6NxvwRjjIj8HqYD0e6WGBValidBIVdEzn4Tx4";
    public static final String TWITTER_SEARCH_URL_TEMPLATE = "https://api.twitter.com/1.1/search/tweets.json?src=typd&q={0}";

    public String account;
    public List<NewsItem> newsItems;

    public News(String account) {
        account = "@" + account;
    }

    public void update() {
        String bearerKey = authenticateAndGetBearerKey();

        if (bearerKey != null) {
            getTwitterEntriesFor("#HackManchester", bearerKey);
        }
    }

    private List<NewsItem> getTwitterEntriesFor(String searchTerm, String bearerKey) {
        newsItems = new ArrayList<NewsItem>();

        String url = MessageFormat.format(TWITTER_SEARCH_URL_TEMPLATE, URLEncoder.encode(searchTerm));

        WS.WSRequest getRequest = WS.url(url);
        getRequest.setHeader("Authorization", "Bearer " + bearerKey);
        WS.HttpResponse result = getRequest.get();

        JsonElement contentJson = result.getJson();
        if (contentJson.isJsonObject()) {
            JsonElement statusesElement = contentJson.getAsJsonObject().get("statuses");

            JsonArray statusesArray = statusesElement.getAsJsonArray();
            for (JsonElement element: statusesArray) {
                JsonObject jsonObject = element.getAsJsonObject();
                String mediaUrl = "";

                if (jsonObject.get("entities") != null) {
                    JsonObject jsonEntitiesObject = jsonObject.get("entities").getAsJsonObject();

                    if (jsonEntitiesObject.get("media") != null) {
                        JsonArray jsonMediaArray = jsonEntitiesObject.get("media").getAsJsonArray();

                        JsonObject jsonMediaObject = jsonMediaArray.get(0).getAsJsonObject();

                        if (jsonMediaObject.get("media_url_https") != null) {
                            JsonElement jsonMediaUrlElement = jsonMediaObject.get("media_url_https");
                            System.out.println(jsonMediaUrlElement.getAsString());
                            mediaUrl = jsonMediaUrlElement.getAsString();
                        }
                    }
                }

                newsItems.add(new NewsItem(
                        jsonObject.get("created_at").getAsString(),
                        jsonObject.get("text").toString(),
                        mediaUrl));
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

        JsonElement contentJson = result.getJson();
        if (contentJson.isJsonObject()) {
            JsonElement accessToken = contentJson.getAsJsonObject().get("access_token");
            return accessToken.getAsString();
        }

        return null;
    }
}
