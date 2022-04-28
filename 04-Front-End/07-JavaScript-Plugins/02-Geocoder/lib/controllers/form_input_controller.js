import { Controller } from "stimulus";
import mapboxgl from 'mapbox-gl';

const apiKey = "pk.eyJ1Ijoic2VyZ2lvc2tpMTIzIiwiYSI6ImNsMmpiMXEwNjB0ZHYzY2xhMXF5M2kwZXQifQ.ypgBxX56HGb-DMTD1PfJ3w";

export default class extends Controller {
  static targets = ["input", "insert"]

  connect() {
    console.log("welcome stimulus");
  }

  allInput(event) {
    event.preventDefault();
    fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${this.inputTarget.value}.json?access_token=${apiKey}`)
      .then(response => response.json())
      .then((data) => {
        console.log(data);
        const longitud = data.features[0].geometry.coordinates[0];
        const latitud = data.features[0].geometry.coordinates[1];
        this.insertTarget.innerText = `longitud: ${longitud} latitud: ${latitud}`;
        mapboxgl.accessToken = apiKey;
        const map = new mapboxgl.Map({
          container: 'map',
          style: 'mapbox://styles/mapbox/streets-v9',
          center: [longitud, latitud],
          zoom: 12
        });
        new mapboxgl.Marker()
          .setLngLat([longitud, latitud])
          .addTo(map);
      });
  }
}
