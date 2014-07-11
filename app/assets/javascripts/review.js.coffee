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


calculate_predicted = () ->
  old_w = parseFloat($("#current-weight").data("weight"))
  new_w = parseFloat($("#desired-weight").val())

  $("#predicted-change").html(weight_vs_ahi(old_w,new_w)+" %")


weight_vs_ahi = (old_weight, new_weight) ->
  weight_change = ((new_weight-old_weight)/old_weight) * 100
  Math.round((2.938 * weight_change))

draw_ahi_graph = () ->
  data = [
    {weight_change: -20, ahi_change: -48},
    {weight_change: -10, ahi_change: -26},
    {weight_change: -5, ahi_change: -14},
    {weight_change: 5, ahi_change: 15},
    {weight_change: 10, ahi_change: 32},
    {weight_change: 20, ahi_change: 70}
  ]


  m = {top: 20, right: 20, bottom: 30, left: 40}
  w = 750 - m.left - m.right
  h = 400 - m.top - m.bottom
  xa = d3.scale.ordinal().rangeRoundBands([0, w], .1)
  ya = d3.scale.linear().range([h, 0])



  # Create Graph Area
  svg = d3.select("#ahi-graph")
  .append("svg")
  .attr("width", w + m.left + m.right)
  .attr("height", h + m.top + m.bottom)
  .append("g")
  .attr("transform", "translate(" + m.left + "," + m.top + ")")

  xa.domain([-20, -10, -5, 5, 10, 20])
  ya.domain([100, -100])

  xAxis = d3.svg.axis().scale(xa).orient("bottom")
  yAxis = d3.svg.axis().scale(ya).orient("left").ticks(20)


  # Create X Axis
  svg.append("g")
  .attr("class", "x axis")
  .attr("transform", "translate(0," + h + ")")
  .call(xAxis)
  .append('text')
  .attr("x", w/2)
  .attr("y", 27)
  .attr("dx", ".71em")
  .style("text-anchor", "middle")
  .text('Change in Weight (%)')

  # Create Y Axis
  svg.append("g")
  .attr("class", "y axis")
  .call(yAxis)
  .append("text")
  .attr("transform", "rotate(-90)")
  .attr("y", 0 - m.left)
  .attr("x", 0 - (h/2))
  .attr("dy", "1em")
  .style("text-anchor", "middle")
  .text("Change in AHI (%)")


  graph = svg.selectAll(".bar").data(data)

  console.log(xa(-10))

  graph.enter().append("rect")
  .attr("class", "bar")
  .attr("x", (d) -> xa(d.weight_change))
  .attr("width", w/6 - 10)
  .attr("y", (d) -> d3.min([h - ya(d.ahi_change), ya(0)]))
  .attr("height", (d) -> Math.abs(ya(d.ahi_change) - ya(0)))

  window.xa = xa
  window.ya = ya





@reviewReady = () ->
  #set_up_graph()
  draw_ahi_graph()
  $(document).on 'change', '#desired-weight', () ->
    calculate_predicted()











