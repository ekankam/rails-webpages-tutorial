//= require jquery
//= require bootstrap-sprockets

function heroImageLoaded() {
  const container = document.getElementById("hero-image-container");

  if (container) {
    container.classList.remove("skeleton");
  }
}
