http --form POST overpass-api.de/api/interpreter data="[out:json];area[name="Berlin"];node(area)["man_made"="water_well"][\"description\"=\"Berliner Straßenbrunnen\"];out center;" > data--man_made--water_well.json
# To get this URL:
# 1. https://overpass-turbo.eu/
# 2. Query: [out:json];area[name=Berlin];(node["removed:man_made"="water_well"](area););out center;
# 3. Export => Daten => Rohdaten direkt von Overpass API
# 4. URL kopieren, hier einfügen
# Warum: Der Weg, der hier sonst verwendet wird, liefert einen Syntax-Error in der Response.
http --form GET https://overpass-api.de/api/interpreter?data=%5Bout%3Ajson%5D%3Barea%5Bname%3DBerlin%5D%3B%28node%5B%22removed%3Aman_made%22%3D%22water_well%22%5D%28area%29%3B%29%3Bout%20center%3B%0A > data--man_made--water_well_removed.json
http --form POST overpass-api.de/api/interpreter data="[out:json];area[name="Berlin"];(way["playground"="swing"](area);node["playground"="swing"](area););out center;" > data--playground--swing.json
http --form POST overpass-api.de/api/interpreter data="[out:json];area[name="Berlin"];(way["leisure"="playground"](area);node["leisure"="playground"](area););out center;" > data--leisure--playground.json
http --form POST overpass-api.de/api/interpreter data="[out:json];area[name="Berlin"];(way["advertising"="column"](area);node["advertising"="column"](area););out center;" > data--advertising--column.json
# http --form POST overpass-api.de/api/interpreter data="[out:json];area[name="Berlin"];(way["bicycle_parking"](area);node["bicycle_parking"](area););out center;" > data--bicycle_parking.json
http --form POST overpass-api.de/api/interpreter data="[out:json];area[name="Berlin"];(node["highway"="speed_camera"](area);way["highway"="speed_camera"](area););out center;" > data--speed_camera.json
