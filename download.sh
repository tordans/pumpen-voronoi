http --form POST overpass-api.de/api/interpreter data="[out:json];area[name=\"Berlin\"];node(area)[\"man_made\"=\"water_well\"][\"description\"=\"Berliner Straßenbrunnen\"];out center;" > data--man_made--water_well.json
http --form POST overpass-api.de/api/interpreter data="[out:json];area[name=\"Berlin\"];(way[playground=swing](area);node[playground=swing](area););out center;" > data--playground--swing.json
http --form POST overpass-api.de/api/interpreter data="[out:json];area[name=\"Berlin\"];(way[leisure=playground](area);node[leisure=playground](area););out center;" > data--leisure--playground.json
http --form POST overpass-api.de/api/interpreter data="[out:json];area[name=\"Berlin\"];(way[advertising=column](area);node[advertising=column](area););out center;" > data--advertising--column.json
http --form POST overpass-api.de/api/interpreter data="[out:json];area[name=\"Berlin\"];(way[bicycle_parking](area);node[bicycle_parking](area););out center;" > data--bicycle_parking.json
http --form POST overpass-api.de/api/interpreter data="[out:json];area[name=\"Berlin\"];(way[highway=speed_camera](area);node[highway=speed_camera](area););out center;" > data--speed_camera.json
