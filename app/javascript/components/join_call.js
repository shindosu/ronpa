const removeCallButton = () => {
  console.log("inside here");

  const joinCall = document.getElementById("join-call")
  if (joinCall) {
    document.querySelector(".moderator-call").insertAdjacentHTML('beforeend', '<i class="fas fa-phone call-two"></i>');
    document.querySelectorAll(".phone-call")[1].insertAdjacentHTML('beforeend', '<i class="fas fa-phone call"></i>');
    joinCall.addEventListener("click", (event) => {
      joinCall.remove();
      document.querySelector(".phone-call").insertAdjacentHTML('beforeend', '<i class="fas fa-phone call-three"></i>');
    })
  }
}

export { removeCallButton };
