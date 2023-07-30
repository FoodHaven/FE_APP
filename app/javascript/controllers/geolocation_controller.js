import { Controller } from "@hotwired/stimulus"

const options = {
  enableHighAccuracy: true,
  maximumAge: 0
};
// Connects to data-controller="geolocation"
export default class extends Controller {
  static values = { url: String }

  
  success(pos) {
    const crd = pos.coords;
    // redirect with coordinates in params
    location.assign(`/markets?latitude=${crd.latitude}&longitude=${crd.longitude}`)
  }
  
  error(err) {
    console.warn(`ERROR(${err.code}): ${err.message}`);
  }
  
  search() {
    navigator.geolocation.getCurrentPosition(this.success.bind(this), this.error, options);
  }
}