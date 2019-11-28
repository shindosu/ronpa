const feedbackButtonTan = document.querySelectorAll('.feedback-icon-tan');

const feedbackButtonActiveTan = () => {
  feedbackButtonTan.forEach((button) => {
    button.addEventListener("click", (event) => {
      console.log("hello");
    event.currentTarget.classList.add("feedback-button-active-tan");
    });
  });
}


const feedbackButtonRed = document.querySelectorAll('.feedback-icon-red');

const feedbackButtonActiveRed = () => {
  feedbackButtonRed.forEach((button) => {
    button.addEventListener("click", (event) => {
      console.log("hello");
    event.currentTarget.classList.add("feedback-button-active-red");
    });
  });
}

export { feedbackButtonActiveTan, feedbackButtonActiveRed };
