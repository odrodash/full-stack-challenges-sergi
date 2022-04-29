import { Controller } from "stimulus";

const date = new Date().toDateString();

export default class extends Controller {
  static targets = ["input", "date", "city", "temperature", "description"]

  connect() {
    console.log("hello perros");
  }

  inputActive(event) {
    event.preventDefault();
    fetch(`http://api.openweathermap.org/geo/1.0/direct?q=${this.inputTarget.value}&limit=5&appid=a0049d0aeaaf552093553d626e03e366`)
      .then(response => response.json())
      .then((data) => {
        console.log(data);
        const name = data[0].name;
        const latitud = data[0].lat;
        const longitud = data[0].lon;
        fetch(`https://api.openweathermap.org/data/2.5/weather?lat=${latitud}&lon=${longitud}&units=metric&appid=a0049d0aeaaf552093553d626e03e366`)
          .then(response => response.json())
          .then((dato) => {
            console.log(dato);
            const temperature = `${dato.main.temp}C°`;
            const description = dato.weather[0].description;
            this.dateTarget.innerText = date;
            this.cityTarget.innerText = name;
            this.temperatureTarget.innerText = temperature;
            this.descriptionTarget.innerText = description;
          });
      });
  }
}
