import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    markersevent: Array,
    polygon: Object
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      minZoom: 4,
      style: "mapbox://styles/alexmcfly/clikchnpc00en01qvd5kjhaz3"
    })
    this.map.addControl(new mapboxgl.NavigationControl());
    this.#addPolygonToMap()
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const customMarker = document.createElement("div")
    customMarker.innerHTML = marker.marker_html
      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    })
    this.markerseventValue.forEach((event) => {
      const customMarker = document.createElement("div")
    customMarker.innerHTML = event.marker_html
      new mapboxgl.Marker(customMarker)
        .setLngLat([ event.lng, event.lat ])
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    // const bounds = new mapboxgl.LngLatBounds()
    // this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    // this.markerseventValue.forEach(markerevent => bounds.extend([ markerevent.lng, markerevent.lat ]))
    // this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
    this.map.fitBounds([
      [-11.396181192912564,
        52.76849938719249], // southwestern corner of the bounds
      [14.768697117463944,
        40.22151693600034] // northeastern corner of the bounds
      ], { padding: 70, maxZoom: 15, duration: 0 })
  }

  #addPolygonToMap () {
    this.map.on('load', () => {
      // Add a data source containing GeoJSON data.
      const features = this.polygonValue.features.map((feature) => {
        const result = {
          'type': 'Feature',
          'geometry': {
            'type': 'Polygon',
            'coordinates': [
              feature.geometry.coordinates
              ]
            }
          }
        return result

      })

      this.map.addSource('paris', {
        'type': 'geojson',
        'data': {
        'type': 'FeatureCollection',
        'features': features
        }
        });

      // Add a new layer to visualize the polygon.
      this.map.addLayer({
          'id': 'main',
          'type': 'fill',
          'source': 'paris', // reference the data source
          'layout': {},
          'paint': {
              'fill-color': '#9DB2BF', // blue color fill
              'fill-opacity': 0.1
          }
      });
      // Add a black outline around the polygon.
      this.map.addLayer({
          'id': 'outline',
          'type': 'line',
          'source': 'paris',
          'layout': {},
          'paint': {
              'line-color': '#27374D',
              'line-width': 3
          }
      });
  });
  }
}
