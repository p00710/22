import pygal
bar_chart=pygal.Bar()
bar_chart.add("Series 1",[10,15,7,35])
bar_chart.add("Series 2",[5,8,10,34])
bar_chart.add("Series 3",[12,9,25,3])
bar_chart.title="BAR CHART EXAMPLE"
bar_chart.render_to_file("BAR.svg")
