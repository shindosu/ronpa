const initFlip = () => {
  const cards = document.querySelectorAll('.flip-card');
  console.log(cards);
  if (cards) {
    cards.forEach ((card) => {
      console.log(card);
      card.addEventListener( 'click', function() {
        card.classList.add('is-flipped');
      });
    });
  };
}

export { initFlip };

