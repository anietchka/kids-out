const initCurrentPosition = () => {
  const inputLongitude = document.querySelector('#longitude')
  const inputLatitude = document.querySelector('#latitude')
  const next = document.querySelector('#next')

  navigator.geolocation.getCurrentPosition(async (data) => {
    const longitude = data.coords.longitude
    const latitude = data.coords.latitude
    /* const response = await fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${longitude}%2C%20${latitude}.json?access_token=pk.eyJ1Ijoib3NsYW5uZSIsImEiOiJja3NweXQ5eDQwN3N1MnBucTRpczY1dXAyIn0.OsggNoy1h_GzZk5ndqunKQ`)
    const payload = await response.json()
    console.log(payload.features[0])
    const address = payload.features[0].place_name */
    inputLongitude.value = longitude
    inputLatitude.value = latitude
    next.click()
  });
};

var pos = document.querySelector("#current-position");

if (pos) {
  pos.addEventListener("click", (ev) => {
    ev.preventDefault();
    initCurrentPosition();
  });
}

export { initCurrentPosition };
