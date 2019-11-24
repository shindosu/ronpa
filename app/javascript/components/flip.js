const initFlip = () => {
  const card = document.querySelector('.card');
  if (card) {
    card.addEventListener( 'click', function() {
      card.classList.add('is-flipped');
    });
  };
}

export { initFlip };

