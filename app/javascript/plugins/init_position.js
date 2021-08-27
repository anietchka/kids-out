const initCurrentPosition = () => {
  const inputLongitude = document.querySelector("#coordinates_longitude")
  const inputLatitude = document.querySelector("#coordinates_latitude")
  const form = document.querySelector("form")

  navigator.geolocation.getCurrentPosition((data) => {
    inputLongitude.value = data.coords.longitude;
    inputLatitude.value = data.coords.latitude;
    form.submit();
    console.log(inputLongitude);
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
