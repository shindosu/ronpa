import Timer from 'easytimer.js';

let timer = new Timer();
let phase_status = document.querySelector(".phase-status")

switch (phase_status) {

  case "waiting_start":
      timer.start({countdown: true, startValues: {seconds: 30}});
  break;
  case "count_in":
      timer.start({countdown: true, startValues: {seconds: 10}});
  break;
  case "affirmative_speech":
      timer.start({countdown: true, startValues: {seconds: 480}});
  break;
  case "negative_cross_examination_preparation":
      timer.start({countdown: true, startValues: {seconds: 10}});
  break;
  case "negative_cross_examination":
      timer.start({countdown: true, startValues: {seconds: 480}});
  break;
  case "negative_speech":
      timer.start({countdown: true, startValues: {seconds: 480}});
  break;
  case "affirmative_cross_examination_preparation":
      timer.start({countdown: true, startValues: {seconds: 10}});
  break;
  case "affirmative_cross_examination":
      timer.start({countdown: true, startValues: {seconds: 480}});
  break;
  case "negative_closing_statement":
      timer.start({countdown: true, startValues: {seconds: 480}});
  break;
  case "affirmative_closing_statement":
      timer.start({countdown: true, startValues: {seconds: 480}});
  break;
  case "waiting_end":
      timer.start({countdown: true, startValues: {seconds: 30}});
  break;
  case "finished":
      timer.start({countdown: true, startValues: {seconds: 0}});
  break;
}

let values = document.querySelector(".values")
const button = document.querySelector(".button")

timer.addEventListener('secondsUpdated', (event) => {
  values.innerHTML = timer.getTimeValues().toString()
});

button.addEventListener("click", (event) => {
  timer.stop();
})
