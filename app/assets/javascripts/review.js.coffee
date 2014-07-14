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


calculate_predicted_ahi_change = () ->
  height = parseFloat($("#height").data("height"))
  old_w = parseFloat($("#current-weight").data("weight"))
  new_w = parseFloat($("#desired-weight").val())

  $("#predicted-change").html(weight_vs_ahi(old_w,new_w)+" %")
  $("#predicted-bmi").html(get_bmi(height, new_w))

weight_vs_ahi = (old_weight, new_weight) ->
  weight_change = ((new_weight-old_weight)/old_weight) * 100
  Math.round((2.938 * weight_change))

get_bmi = (height, weight) ->
  Math.round((weight / (height * height)) * 703)



draw_frequency_table = () ->
  table = d3.select("#freq-table").append("table")
  .attr("class", "table table-bordered")

  @columns = ["label", "frequency"]
  thead = table.append("thead")
  tbody = table.append("tbody")

  #thead.selectAll("th").data(columns).enter().append("th").text((d) -> d)


  update_frequency_table()

update_frequency_table = () ->
  tbody = d3.select("#freq-table table tbody")
  question_id = $("#question-select").val()
  answer_session_id = $("#question-select").data("answer-session-id")
  qf_path = $("#question-select").data("json-path")

  d3.json(qf_path+'/'+question_id+'/'+answer_session_id+'.json', (error, json_data) ->
    user_answer = json_data.user_answer
    data = json_data.frequencies.map((f) -> { label: f.label, frequency: ((f.frequency * 100) + "%") })

    rows = tbody.selectAll("tr").data(data)

    rows.exit().remove()

    rows.enter()
    .append("tr")

    rows.attr('class', (d) ->
      if user_answer == d.label
        "active"
      else
        ""
    )

    cells = rows.selectAll("td")
    .data((row) -> columns.map((column) ->
      {column: column, value: row[column]}
    ))

    cells.exit().remove()

    cells.enter()
    .append("td")

    cells.html((d) -> d.value )


  )


draw_frequency_graph = () ->
  width = 300
  height = 300
  @radius = 150
  @color = d3.scale.category20c();
  @arc = d3.svg.arc().outerRadius(radius)
  @pie = d3.layout.pie().value((d) -> d.frequency)

  svg = d3.select("#freq-graph").append('svg')
  .attr("height", height)
  .attr("width", width)
  .append("g")
  .attr("transform", "translate("+radius+","+radius+")")



  update_frequency_graph()



update_frequency_graph = () ->
  question_id = $("#question-select").val()
  answer_session_id = $("#question-select").data("answer-session-id")
  qf_path = $("#question-select").data("json-path")

  d3.json(qf_path+'/'+question_id+'/'+answer_session_id+'.json', (error, json_data) ->
    arcs = d3.select("#freq-graph svg g").selectAll("g.slice")
      .data(pie(json_data.frequencies))

    entrance = arcs.enter()
    .append("g")
    .attr("class", "slice")
    entrance.append("path")
    .attr("fill", (d,i) -> color(i))
    .attr("d", arc)
    entrance.append("text")
    .attr("transform", (d) ->
      d.innerRadius = 0
      d.outerRadius = radius
      "translate(" + arc.centroid(d) + ")"
    )
    .attr("dy", ".35em")
    .style("text-anchor", "middle")
    .text((d) -> d.data.label);


    arcs.exit().remove();
  )



###

  arcs = d3.select("#freq-graph svg").selectAll("g.slice")

  joined = arcs.data(data)
  .data(data)



  arcs.enter().append("g")
  .attr("class", "slice")

  arcs.append('svg:path')
  .attr("fill", (d, i) -> color(i))
  .attr("d", arc)


  var vis = d3.select("<%= selector %>")
  .append("svg:svg")              //create the SVG element inside the <body>
  .data([data])                   //associate our data with the document
  .attr("width", w)           //set the width and height of our visualization (these will be attributes of the <svg> tag
  .attr("height", h)
  .append("svg:g")                //make a group to hold our pie chart
  .attr("transform", "translate(" + r + "," + r + ")")    //move the center of the pie chart from 0, 0 to radius, radius

  var arc = d3.svg.arc()              //this will create <path> elements for us using arc data
  .outerRadius(r);

  var pie = d3.layout.pie()           //this will create arc data for us given a list of values
  .value(function(d) { return d.value; });    //we must tell it out to access the value of each element in our data array

  var arcs = vis.selectAll("g.slice")     //this selects all <g> elements with class slice (there aren't any yet)
  .data(pie)                          //associate the generated pie data (an array of arcs, each having startAngle, endAngle and value properties)
  .enter()                            //this will create <g> elements for every "extra" data element that should be associated with a selection. The result is creating a <g> for every object in the data array
  .append("svg:g")                //create a group to hold each slice (we will have a <path> and a <text> element associated with each slice)
  .attr("class", "slice");    //allow us to style things in the slices (like text)

  arcs.append("svg:path")
  .attr("fill", function(d, i) { return color(i); } ) //set the color for each slice to be chosen from the color function defined above
  .attr("d", arc);                                    //this creates the actual SVG path using the associated data (pie) with the arc drawing function



###




draw_bmi_graph = () ->
  data = [
    { label: "Underweight", color: "underweight", from: 0, to: 18.5 },
    { label: "Normal", color: "normal", from: 18.5, to: 25 },
    { label: "Overweight", color: "overweight", from: 25, to: 30 },
    { label: "Obese", color: "obese", from: 30, to: 45 },
  ]

  bmi = parseFloat($("#bmi").data("bmi"))


  m = {top: 15, right: 5, bottom: 20, left: 5}
  w = 457 - m.left - m.right
  h = 90 - m.top - m.bottom
  x = d3.scale.linear().range([0, w])

  svg = d3.select("#bmi-graph svg.chart")
  .attr("class", "chart")
  .attr("height", h + m.top + m.bottom)
  .attr("width", w + m.right + m.left)
  .append("g")
  .attr("transform", "translate("+m.left+","+m.top+")")

  x.domain([0,45])

  xAxis = d3.svg.axis().scale(x).orient("bottom").tickValues([0, 18.5, 25, 30, 45, bmi])

  svg.append("g")
  .attr("class", "x axis")
  .attr("transform", "translate(0,"+h+")")
  .call(xAxis)

  graph = svg.selectAll(".bar").data(data).enter()

  graph.append("rect")
  .attr("class", (d) -> d.color)
  .attr("x", (d) -> x(d.from))
  .attr("width", (d) -> x(d.to - d.from))
  .attr("height", h)
  .attr("y", 0)

  graph.append("text")
  .style("text-anchor", "middle")
  .style("font-size", '10px')
  .style("font-weight", 'bold')
  .text((d) -> d.label)
  .attr("x", (d) -> x(((d.to - d.from)/2)+ d.from) )
  .attr("y", -7)

  svg.append('svg:line')
  .attr('class', 'my_bmi')
  .attr("x1", x(bmi))
  .attr("x2", x(bmi))
  .attr("y1", -1)
  .attr("y2", h+1)
  .attr("stroke-width", 2)
  .attr("stroke", "black")



draw_ahi_graph = () ->
  data = [
    {weight_change: -20, ahi_change: -48},
    {weight_change: -10, ahi_change: -26},
    {weight_change: -5, ahi_change: -14},
    {weight_change: 5, ahi_change: 15},
    {weight_change: 10, ahi_change: 32},
    {weight_change: 20, ahi_change: 70}
  ]


  m = {top: 10, right: 10, bottom: 30, left: 40}
  w = 750 - m.left - m.right
  h = 350 - m.top - m.bottom
  xa = d3.scale.ordinal().rangeRoundBands([0, w], .1)
  ya = d3.scale.linear().range([h, 0])



  # Create Graph Area
  svg = d3.select("#ahi-graph svg.chart")
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
  draw_bmi_graph()
  draw_frequency_table()
  draw_frequency_graph()
  $(document).on 'change', '#desired-weight', () ->
    calculate_predicted_ahi_change()
  $(document).on 'change', '#question-select', () ->
    update_frequency_table()
    update_frequency_graph()











