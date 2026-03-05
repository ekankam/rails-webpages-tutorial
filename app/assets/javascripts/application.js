//= require jquery
//= require bootstrap-sprockets

// app/assets/javascripts/application.js

function removeSkeletonFor(img) {
  var wrap = img.closest(".hero-image-wrap");
  if (!wrap) return;

  wrap.classList.remove("skeleton");
  wrap.classList.add("loaded");
}

function initHeroImageSkeletons() {
  var imgs = document.querySelectorAll("img.hero-avatar");

  imgs.forEach(function (img) {
    // If image is already cached/complete, load event may not help
    if (img.complete && img.naturalWidth > 0) {
      removeSkeletonFor(img);
      return;
    }

    img.addEventListener("load", function () {
      removeSkeletonFor(img);
    });

    img.addEventListener("error", function () {
      // Optional: remove skeleton even on error so it doesn't look stuck
      removeSkeletonFor(img);
    });
  });
}

// Works with Turbo
document.addEventListener("turbo:load", initHeroImageSkeletons);
// Also works without Turbo
document.addEventListener("DOMContentLoaded", initHeroImageSkeletons);
