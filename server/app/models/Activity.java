package models;

public class Activity {
    public int numberOfCommits;

    public void update() {
        numberOfCommits = (int) Math.random() % 100 + 1;
    }
}
