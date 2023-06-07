import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    markersevent: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/alexmcfly/clikchnpc00en01qvd5kjhaz3"
    })

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
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.markerseventValue.forEach(markerevent => bounds.extend([ markerevent.lng, markerevent.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  #addPolygonToMap () {
    this.map.on('load', () => {
      // Add a data source containing GeoJSON data.
      this.map.addSource('polygon', {
          'type': 'geojson',
          'data': './map.geojson'
      });

      // Add a new layer to visualize the polygon.
      this.map.addLayer({
          'id': 'main',
          'type': 'fill',
          'source': 'polygon', // reference the data source
          'layout': {},
          'paint': {
              'fill-color': '#0080ff', // blue color fill
              'fill-opacity': 0.5
          }
      });
      // Add a black outline around the polygon.
      this.map.addLayer({
          'id': 'outline',
          'type': 'line',
          'source': 'polygon',
          'layout': {},
          'paint': {
              'line-color': '#000',
              'line-width': 3
          }
      });
  });
  }
}
