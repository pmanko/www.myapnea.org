#@margin = {top: 20, right: 20, bottom: 30, left: 40}
#@width = 750 - margin.left - margin.right
#@height = 400 - margin.top - margin.bottom
#@x = d3.scale.linear().rangeRoundBands([0, width], .1)
#@y = d3.scale.linear().range([height, 0])
#
#@set_up_graph = () ->
#
#  xAxis = d3.svg.axis().scale(x).orient("bottom")
#  yAxis = d3.svg.axis().scale(y).orient("left").ticks(10, "%")
#
#  svg = d3.select("#history")
#  .append("svg")
#  .attr("width", width + margin.left + margin.right)
#  .attr("height", height + margin.top + margin.bottom)
#  .append("g")
#  .attr("transform", "translate(" + margin.left + "," + margin.top + ")")
#
#  d3.tsv("/data.tsv", type, (data) ->
#    window.data = data
#
#
#    svg.append("g")
#    .attr("class", "x axis")
#    .attr("transform", "translate(0," + height + ")")
#    .call(xAxis);
#
#    svg.append("g")
#    .attr("class", "y axis")
#    .call(yAxis)
#    .append("text")
#    .attr("transform", "rotate(-90)")
#    .attr("y", 6)
#    .attr("dy", ".71em")
#    .style("text-anchor", "end")
#    .text("Frequency");
#
#    update(data)
#
#  )
#
#@type = (d) ->
#  d.frequency = +d.frequency
#  d
#
#@update = (data) ->
#  svg = d3.select("#ahi-graph svg")
#
#  x.domain(data.map( (d) -> d.letter ))
#  y.domain([0, d3.max(data, (d) ->d.frequency)])
#
#  graph = svg.selectAll(".bar").data(data)
#
#
#  graph.enter().append("rect")
#  .attr("class", "bar")
#  .attr("x", (d) -> x(d.letter))
#  .attr("width", x.rangeBand())
#  .attr("y", (d) -> y(d.frequency))
#  .attr("height", (d) -> height - y(d.frequency))
#  .transition()
#  .duration(750)
#  .style("fill-opacity", 1)
#
#  graph.exit()
#  .transition()
#  .duration(750)
#  .style("fill-opacity", 1e-6)
#  .remove()

@weight_vs_ahi = (old_weight, new_weight) ->
  weight_change = ((new_weight-old_weight)/old_weight) * 100
  (2.938 * weight_change) + 4.833

@ahi_data = [
  {weight_change: -20, ahi_change: -48},
  {weight_change: -10, ahi_change: -26},
  {weight_change: -5, ahi_change: -14},
  {weight_change: 5, ahi_change: 15},
  {weight_change: 10, ahi_change: 32},
  {weight_change: 20, ahi_change: 70}
]



ahi_graph = (data) ->
  m = {top: 20, right: 20, bottom: 30, left: 40}
  w = 750 - m.left - m.right
  h = 400 - m.top - m.bottom
  xa = d3.scale.linear().range([0, w])
  ya = d3.scale.linear().range([h, 0])

  xAxis = d3.svg.axis().scale(xa).orient("bottom")
  yAxis = d3.svg.axis().scale(ya).orient("left").ticks(10, "%")

  # Create Graph Area
  svg = d3.select("#ahi-graph")
  .append("svg")
  .attr("width", w + m.left + m.right)
  .attr("height", h + m.top + m.bottom)
  .append("g")
  .attr("transform", "translate(" + m.left + "," + m.top + ")")

  # Create X Axis
  svg.append("g")
  .attr("class", "x axis")
  .attr("transform", "translate(0," + h + ")")
  .call(xAxis);

  # Create Y Axis
  svg.append("g")
  .attr("class", "y axis")
  .call(yAxis)
  .append("text")
  .attr("transform", "rotate(-90)")
  .attr("y", 6)
  .attr("dy", ".71em")
  .style("text-anchor", "end")
  .text("Frequency");

  xa.domain([d3.min(data, (d) -> d.weight_change), d3.max(data, (d) -> d.weight_change)])
  ya.domain([d3.min(data, (d) -> d.ahi_change), d3.max(data, (d) ->d.ahi_change)])

  graph = svg.selectAll(".bar").data(data)

  console.log(xa(-10))

  graph.enter().append("rect")
  .attr("class", "bar")
  .attr("x", (d) -> xa(d.weight_change))
  .attr("width", 20)
  .attr("y", (d) -> ya(d.ahi_change))
  .attr("height", (d) -> h - ya(d.ahi_change))


@reviewReady = () ->
  #set_up_graph()
  ahi_graph(ahi_data)











