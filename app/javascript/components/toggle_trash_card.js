const toggleTrashCard = () => {
  let touchstartX = 0;
  let touchstartY = 0;
  let touchendX = 0;
  let touchendY = 0;


  function handleGesture() {


/*     if (touchendX > touchstartX) {
      console.log('Swiped right');
    }

    if (touchendY < touchstartY) {
      console.log('Swiped up');
    }

    if (touchendY > touchstartY) {
      console.log('Swiped down');
    }

    if (touchendY === touchstartY) {
      console.log('Tap');
    } */
  }

  const gestureZones = document.querySelectorAll('.card-meetup-with-trash');
  gestureZones.forEach((gestureZone) => {
    gestureZone.addEventListener('touchstart', function (event) {
      touchstartX = event.changedTouches[0].screenX;
      touchstartY = event.changedTouches[0].screenY;
    }, false);

    gestureZone.addEventListener('touchend', function (event) {
      touchendX = event.changedTouches[0].screenX;
      touchendY = event.changedTouches[0].screenY;
      if (touchendX < touchstartX) {
        event.currentTarget.classList.add("swiped");
      }

      if ((touchendX > touchstartX) && (event.currentTarget.classList.contains("swiped")) ) {
        event.currentTarget.classList.remove("swiped");
        console.log('Swiped right');
      }
    }, false);
  })

};

export {toggleTrashCard};
