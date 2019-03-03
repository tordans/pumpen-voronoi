requirejs.config({
    baseUrl: 'bower_components',
});

// https://stackoverflow.com/a/11920807
function getHashValue(key) {
  var matches = location.hash.match(new RegExp(key+'=([^&]*)'));
  return matches ? matches[1] : null;
}

// hacky way to use the hash-hyperlinks in index.html
window.onhashchange = function() {
  window.location.reload();
}

// Start the main app logic.
requirejs(['lodash/lodash', 'd3/d3', 'leaflet/dist/leaflet'],
function   (lodash,         d3,      leaflet) {
  var map = L.map('map').setView([52.505, 13.41], 11);

  L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
    maxZoom: 18,
}).addTo(map);

  var points, voronoi;
  var svg;
  var path;
  var svgPoints;

  // set up svg
  function createSvg(){
    svg = d3.select(map.getPanes().overlayPane).append("svg")
            .attr('id', 'overlay')
            .attr("class", "leaflet-zoom-hide");
    path      = svg.append("g").classed("paths",  true).selectAll("path");
    svgPoints = svg.append("g").classed("points", true).selectAll("circle");
  }

  var mapLayer = {
    onAdd: function(map) {
      map.on('viewreset moveend', drawLayer);
      createSvg();
      positionSvg();
      drawLayer();
    }
  };

  voronoi = d3.geom.voronoi()
    .x(function(d) { return d.x; })
    .y(function(d) { return d.y; });

  function polygon(d) {
    if (d){
      return "M" + d.join("L") + "Z";
      }
  }

  function positionSvg(){
      var bounds = map.getBounds();
      var topLeft = map.latLngToLayerPoint(bounds.getNorthWest());
      var bottomRight = map.latLngToLayerPoint(bounds.getSouthEast());
      svg
        .style("width", map.getSize().x + 'px')
        .style("height", map.getSize().y + 'px')
        .style("margin-left", topLeft.x + "px")
        .style("margin-top", topLeft.y + "px");
      svg.selectAll("g").attr("transform", "translate(" + -topLeft.x + "," + -topLeft.y + ")");
      return svg;
  }

  var selection = getHashValue('data') ? getHashValue('data') : 'man_made--water_well';
  var data = 'data--' + selection + '.json';
  // console.log(data);

  d3.json(data, function(json){
    points = json.elements;
    map.addLayer(mapLayer);
  });

  function drawLayer(){
    positionSvg();
    var bounds = map.getBounds();
    var topLeft = map.latLngToLayerPoint(bounds.getNorthWest());
    var drawLimit = bounds.pad(0.4);

    var filteredPoints = points.filter(function(p) {
      console.log(p.type);
      // Some are 'way's (areas with a "center"), some are 'node's.
      if(p.type == "way") {
        var latlng = new L.LatLng(p.center.lat, p.center.lon);
      } else {
        var latlng = new L.LatLng(p.lat, p.lon);
      }
      console.log(latlng);
      return drawLimit.contains(latlng);
    });

    var convertedPoints = filteredPoints.map(function(p){
      var latlng = new L.LatLng(p.lat, p.lon);
      return map.latLngToLayerPoint(latlng);
    });

    svg.selectAll(".points circle").remove();
    var svgPoints2 = svgPoints
                        .data(convertedPoints)
                        .enter();

    svgPoints2.append("circle")
      .attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; })
      .attr("r", 2);

    path = path
      .data(voronoi(convertedPoints), polygon);

    path.exit().remove();

    path.enter().append("path")
        .attr("class", "part")
        .attr("d", polygon);
  }
});
