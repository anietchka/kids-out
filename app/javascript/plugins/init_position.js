const initCurrentPosition = () => {
  const inputLongitude = document.querySelector("#search_longitude")
  const inputLatitude = document.querySelector("#search_latitude")
  const form = document.querySelector("form")

  navigator.geolocation.getCurrentPosition((data) => {
    inputLongitude.value = data.coords.longitude;
    inputLatitude.value = data.coords.latitude;
    document.getElementById('search_address').value = '';
    form.submit();
  });
};

var pos = document.querySelector("#current-position");
if(pos){
  pos.addEventListener("click", (ev) => {
    ev.preventDefault();
    initCurrentPosition();
  });
}

export { initCurrentPosition };
