import pygal
line_chart=pygal.Line()
line_chart.add("Series 1",[10,15,7,35])
line_chart.add("Series 2",[5,8,10,34])
line_chart.add("Series 3",[12,9,25,3])
line_chart.title="LINE CHART EXAMPLE"
line_chart.render_to_file("LINE.svg")