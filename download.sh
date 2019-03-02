http --form POST overpass-api.de/api/interpreter data="[out:json];area[name="Berlin"];node(area)[man_made=water_well];out;" > data--man_made--water_well.json
http --form POST overpass-api.de/api/interpreter data="[out:json];area[name="Berlin"];node(area)[playground=swing];out;" > data--playground--swing.json
http --form POST overpass-api.de/api/interpreter data="[out:json];area[name="Berlin"];node(area)[leisure=playground];out;" > data--leisure--playground.json
http --form POST overpass-api.de/api/interpreter data="[out:json];area[name="Berlin"];node(area)[advertising=column];out;" > data--advertising--column.json
http --form POST overpass-api.de/api/interpreter data="[out:json];area[name="Berlin"];node(area)[bicycle_parking];out;" > data--bicycle_parking.json
