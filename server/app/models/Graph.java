package models;

import data.EventData;

import static com.googlecode.charts4j.Color.*;
import static com.googlecode.charts4j.UrlUtil.normalize;
import static org.junit.Assert.assertEquals;

import java.net.URLEncoder;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.junit.BeforeClass;
import org.junit.Test;

import com.googlecode.charts4j.AxisLabels;
import com.googlecode.charts4j.AxisLabelsFactory;
import com.googlecode.charts4j.AxisStyle;
import com.googlecode.charts4j.AxisTextAlignment;
import com.googlecode.charts4j.Color;
import com.googlecode.charts4j.Data;
import com.googlecode.charts4j.Fills;
import com.googlecode.charts4j.GCharts;
import com.googlecode.charts4j.Line;
import com.googlecode.charts4j.LineChart;
import com.googlecode.charts4j.LineStyle;
import com.googlecode.charts4j.LinearGradientFill;
import com.googlecode.charts4j.Plots;
import com.googlecode.charts4j.Shape;

public class Graph {
	public String graph;

	public Graph(List<Integer> commitsPerHour) {
		final int NUM_POINTS = commitsPerHour.size();
		
		final double[] mywebsite = new double[NUM_POINTS];
		for (int i = 0; i < NUM_POINTS; i++) {
			mywebsite[i] = commitsPerHour.get(i)*10;
			
		}
		Line line1 = Plots.newLine(Data.newData(mywebsite),
				Color.newColor("CA3D05"), "PressRed");
		line1.setLineStyle(LineStyle.newLineStyle(3, 1, 0));
		line1.addShapeMarkers(Shape.DIAMOND, Color.newColor("CA3D05"), 12);
		line1.addShapeMarkers(Shape.DIAMOND, Color.WHITE, 8);
		
		
		// Defining chart.
		LineChart chart = GCharts.newLineChart(line1);
		chart.setSize(800, 600);
		chart.setTitle("Git Commits per hour", WHITE, 14);
		chart.setGrid(5, 5, 10, 1);

		// Defining axis info and styles
		AxisStyle axisStyle = AxisStyle.newAxisStyle(WHITE, 12,
				AxisTextAlignment.CENTER);
		AxisLabels xAxis2 = AxisLabelsFactory.newAxisLabels("14:00", "18:00",
				"02:00", "09:00", "14:00");
		xAxis2.setAxisStyle(axisStyle);
		AxisLabels yAxis = AxisLabelsFactory.newAxisLabels("", "2", "5");
		yAxis.setAxisStyle(axisStyle);
		AxisLabels yAxis2 = AxisLabelsFactory.newAxisLabels("Hits", 2);
		yAxis2.setAxisStyle(AxisStyle.newAxisStyle(WHITE, 14,
				AxisTextAlignment.CENTER));
		yAxis2.setAxisStyle(axisStyle);

		// Adding axis info to chart.
		chart.addXAxisLabels(xAxis2);
		chart.addYAxisLabels(yAxis);
		chart.addYAxisLabels(yAxis2);

		// Defining background and chart fills.
		chart.setBackgroundFill(Fills.newSolidFill(Color.newColor("1F1D1D")));
		LinearGradientFill fill = Fills.newLinearGradientFill(0,
				Color.newColor("363433"), 100);
		fill.addColorAndOffset(Color.newColor("2E2B2A"), 0);
		chart.setAreaFill(fill);
		this.graph = chart.toURLString();
	}
}
