const textWrapper = document.querySelector('.ml11 .letters');
textWrapper.innerHTML = textWrapper.textContent.replace(/([^\x00-\x80]|\w)/g, "<span class='letter'>$&</span>");



const initLetter = () => {
anime.timeline({autoplay: true})
  .add({
    targets: '.ml11 .line',
    scaleY: [0,1],
    opacity: [0.5,1],
    easing: "easeOutExpo",
    duration: 700
  })
  .add({
    targets: '.ml11 .line',
    translateX: [0, document.querySelector('.ml11 .letters').getBoundingClientRect().width + 10],
    easing: "easeOutExpo",
    duration: 700,
    delay: 100
  }).add({
    targets: '.ml11 .letter',
    opacity: [0,1],
    easing: "easeOutExpo",
    duration: 2500,
    offset: '-=775',
    delay: (el, i) => 34 * (i+25)
  }).add({
    targets: '.ml11',
    opacity: 1,
    duration: 1000,
    easing: "easeOutExpo",
    delay: 1000
  });
}

// const initPop = () => {
// anime({
//   targets: '.el',
//   translateY: function(el) {
//     return el.getAttribute('data-x');
//   },
//   translateX: function(el, i) {
//     return 20 + (-20 * i);
//   },
//   scale: function(el, i, l) {
//     return (l / 3) ;
//   },
//   rotate: function() { return anime.random(0, 0); },
//   borderRadius: function() { return ['50%', anime.random(10, 35) + '%']; },
//   duration: function() { return anime.random(1200, 1800); },
//   delay: function() { return anime.random(0, 300); },
//   direction: 'alternate',
//   autoplay: true
// });
// }

// export { initPop };
export { initLetter };
