import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs";

console.log("hello again")

const fetchWithToken = (url, options) => {
  options.headers = {
    "X-CSRF-Token": csrfToken(),
    ...options.headers
  };
  options.credentials = "same-origin";

  return fetch(url, options);
}

export default class extends Controller {
  static targets = [ "query" ]

  connect() {
    console.log(this.queryTarget)
    // this.queryTarget.textContent = 'Hello, Stimulus!'
  }

  send(event) {
    fetchWithToken(`/instruments_search?query=${this.queryTarget.value}`, { headers: { accept: 'application/json', "Content-Type": "application/json" } })
    .then(response => response.json())
    .then((data) => {
      console.log(data);
      const container = document.querySelector(".cards")
      container.innerHTML = ""
      data.instruments.forEach((instrument) => {
        const card = `
        <div class="card-product" id="products">
          <img src="https://source.unsplash.com/185x185/?${instrument.category}" />
          <div class="card-product-infos">
            <div class="card-product-info-left">
              <h3>${instrument.name} </h3>
              <h2>${instrument.category}</h2>
              <p id="description">${instrument.description } </p>
              <a href="/instruments/${instrument.id}" class="card-links">Show instrument</a>
            </div>
            <div class="card-product-info-right">
              <h2>${instrument.location} </h2>
              <h2>${instrument.price}</h2>
            </div>
          </div>
        </div>
        `
        container.insertAdjacentHTML('afterbegin', card)
      })
      // this.searchTarget.innerText = data.instruments.length;
    });
  }
}
