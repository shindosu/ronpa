const communicationButton = document.querySelectorAll('.fa-thumbs-up');
const persuasivenessButton = document.querySelectorAll('.fa-smile');
const civilityButton = document.querySelectorAll('.fa-crown');

const giveFeedback = () => {
  communicationButton.forEach((button) =>
    element.addEventListener('click', function(event) {
      element.parentNode.parentNode.submit();
       element.parentNode.parentNode.preventDefault();
    }
  ))
  persuasivenessButton.forEach((button) =>
    element.addEventListener('click', function(event) {
      element.parentNode.parentNode.submit();
       element.parentNode.parentNode.preventDefault();
    }
  ))
  civilityButton.forEach((button) =>
    element.addEventListener('click', function(event) {
      element.parentNode.parentNode.submit();
       element.parentNode.parentNode.preventDefault();
    }
  ))
};

export { giveFeedback };
