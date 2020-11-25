/* eslint no-console:0 */
import Rails from '@rails/ujs'
import "controllers"
require("alpinejs")

// https://rossta.net/blog/importing-images-with-webpacker.html
require.context('../images', true)
require.context('../videos', true)

document.addEventListener("DOMContentLoaded", function(event) {
  Rails.start();
  var openmodal = document.querySelectorAll('.modal-open')
  for (var i = 0; i < openmodal.length; i++) {
    openmodal[i].addEventListener('click', function(event){
    event.preventDefault()
    toggleModal()
    })
  }

  const overlay = document.querySelector('.modal-overlay')
  overlay.addEventListener('click', toggleModal)

  var closemodal = document.querySelectorAll('.modal-close')
  for (var i = 0; i < closemodal.length; i++) {
    closemodal[i].addEventListener('click', toggleModal)
  }

  document.onkeydown = function(evt) {
    evt = evt || window.event
    var isEscape = false
    if ("key" in evt) {
    isEscape = (evt.key === "Escape" || evt.key === "Esc")
    } else {
    isEscape = (evt.keyCode === 27)
    }
    if (isEscape && document.body.classList.contains('modal-active')) {
    toggleModal()
    }
  };

  function toggleVideo() {
    const video = document.querySelector('#introduction-video')
    if(video.paused) {
      video.play()
    } else {
      video.pause()
    }
  }

  function toggleModal () {
    const body = document.querySelector('body')
    const modal = document.querySelector('.modal')
    modal.classList.toggle('opacity-0')
    modal.classList.toggle('pointer-events-none')
    body.classList.toggle('modal-active')
    toggleVideo()
  }
});
