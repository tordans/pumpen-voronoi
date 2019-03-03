# Voronoi Map Berlin
Voronoi map for the are of Berlin for different type of OpenStreetMap data.

- [Map](http://tordans.github.io/pumpen-voronoi)
- Related: [Pumpen with their official "Versorgungsradius" (Map)](http://pumpen-radius.k-nut.eu/)

![Screenshot](https://raw.githubusercontent.com/k-nut/pumpen-voronoi/master/screenshot.png)


## Update data

All the data is in the `data-*.json` files.
The data is queried from the overpass turbo api ([example](http://overpass-turbo.eu/s/cjg)).

- `out center;` makes sure we get one node for an area that we can render
- but we query both nodes and areas since some data is saved as both, area and node

```
brew install httpie
sh ./download.sh
```

## Setup

Install the dependencies with bower by running

```
bower install
```

## Inspiration

Very much inspired by [Chris Zetter's tutorial](http://chriszetter.com/blog/2014/06/15/building-a-voronoi-map-with-d3-and-leaflet/)
and [Mike Bostock's example](http://bl.ocks.org/mbostock/406036.)
