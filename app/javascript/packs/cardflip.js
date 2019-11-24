const argumentCard = document.querySelector('.argument-card');

argumentCard.addEventListener("click", (event) => {
  event.currentTarget.classList.add('is-flipped');
});

