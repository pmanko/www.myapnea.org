@margin = {top: 20, right: 20, bottom: 30, left: 40}
@width = 750 - margin.left - margin.right
@height = 400 - margin.top - margin.bottom
@x = d3.scale.ordinal().rangeRoundBands([0, width], .1)
@y = d3.scale.linear().range([height, 0])

@set_up_graph = () ->

  xAxis = d3.svg.axis().scale(x).orient("bottom")
  yAxis = d3.svg.axis().scale(y).orient("left").ticks(10, "%")

  svg = d3.select("#ahi-graph")
  .append("svg")
  .attr("width", width + margin.left + margin.right)
  .attr("height", height + margin.top + margin.bottom)
  .append("g")
  .attr("transform", "translate(" + margin.left + "," + margin.top + ")")

  d3.tsv("/data.tsv", type, (data) ->
    window.data = data


    svg.append("g")
    .attr("class", "x axis")
    .attr("transform", "translate(0," + height + ")")
    .call(xAxis);

    svg.append("g")
    .attr("class", "y axis")
    .call(yAxis)
    .append("text")
    .attr("transform", "rotate(-90)")
    .attr("y", 6)
    .attr("dy", ".71em")
    .style("text-anchor", "end")
    .text("Frequency");

    update(data)

  )

@type = (d) ->
  d.frequency = +d.frequency
  d

@update = (data) ->
  svg = d3.select("#ahi-graph svg")

  x.domain(data.map( (d) -> d.letter ))
  y.domain([0, d3.max(data, (d) ->d.frequency)])

  graph = svg.selectAll(".bar").data(data)


  graph.enter().append("rect")
  .attr("class", "bar")
  .attr("x", (d) -> x(d.letter))
  .attr("width", x.rangeBand())
  .attr("y", (d) -> y(d.frequency))
  .attr("height", (d) -> height - y(d.frequency))
  .transition()
  .duration(750)
  .style("fill-opacity", 1)

  graph.exit()
  .transition()
  .duration(750)
  .style("fill-opacity", 1e-6)
  .remove()

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





@reviewReady = () ->
  set_up_graph()










