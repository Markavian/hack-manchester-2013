package models;

import data.EventData;

import static com.googlecode.charts4j.Color.*;
import static com.googlecode.charts4j.UrlUtil.normalize;
import static org.junit.Assert.assertEquals;

import java.net.URLEncoder;
import java.util.Arrays;
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

	public Graph() {
		final int NUM_POINTS = 25;
		final double[] competition = new double[NUM_POINTS];
		final double[] mywebsite = new double[NUM_POINTS];
		for (int i = 0; i < NUM_POINTS; i++) {
			competition[i] = 100 - (Math.cos(30 * i * Math.PI / 180) * 10 + 50)
					* i / 20;
			mywebsite[i] = (Math.cos(30 * i * Math.PI / 180) * 10 + 50) * i
					/ 20;
		}
		Line line1 = Plots.newLine(Data.newData(mywebsite),
				Color.newColor("CA3D05"), "My Website.com");
		line1.setLineStyle(LineStyle.newLineStyle(3, 1, 0));
		line1.addShapeMarkers(Shape.DIAMOND, Color.newColor("CA3D05"), 12);
		line1.addShapeMarkers(Shape.DIAMOND, Color.WHITE, 8);
		Line line2 = Plots.newLine(Data.newData(competition), SKYBLUE,
				"Competition.com");
		line2.setLineStyle(LineStyle.newLineStyle(3, 1, 0));
		line2.addShapeMarkers(Shape.DIAMOND, SKYBLUE, 12);
		line2.addShapeMarkers(Shape.DIAMOND, Color.WHITE, 8);

		// Defining chart.
		LineChart chart = GCharts.newLineChart(line1, line2);
		chart.setSize(600, 450);
		chart.setTitle("Web Traffic|(in billions of hits)", WHITE, 14);
		chart.addHorizontalRangeMarker(40, 60, Color.newColor(RED, 30));
		chart.addVerticalRangeMarker(70, 90, Color.newColor(GREEN, 30));
		chart.setGrid(25, 25, 3, 2);

		// Defining axis info and styles
		AxisStyle axisStyle = AxisStyle.newAxisStyle(WHITE, 12,
				AxisTextAlignment.CENTER);
		AxisLabels xAxis = AxisLabelsFactory.newAxisLabels("Nov", "Dec", "Jan",
				"Feb", "Mar");
		xAxis.setAxisStyle(axisStyle);
		AxisLabels xAxis2 = AxisLabelsFactory.newAxisLabels("2007", "2007",
				"2008", "2008", "2008");
		xAxis2.setAxisStyle(axisStyle);
		AxisLabels yAxis = AxisLabelsFactory.newAxisLabels("", "25", "50",
				"75", "100");
		AxisLabels xAxis3 = AxisLabelsFactory.newAxisLabels("Month", 50.0);
		xAxis3.setAxisStyle(AxisStyle.newAxisStyle(WHITE, 14,
				AxisTextAlignment.CENTER));
		yAxis.setAxisStyle(axisStyle);
		AxisLabels yAxis2 = AxisLabelsFactory.newAxisLabels("Hits", 50.0);
		yAxis2.setAxisStyle(AxisStyle.newAxisStyle(WHITE, 14,
				AxisTextAlignment.CENTER));
		yAxis2.setAxisStyle(axisStyle);

		// Adding axis info to chart.
		chart.addXAxisLabels(xAxis);
		chart.addXAxisLabels(xAxis2);
		chart.addXAxisLabels(xAxis3);
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
