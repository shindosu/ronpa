import Timer from 'easytimer.js';

let timer = new Timer();
let phase_status = document.querySelector(".text-phase").innerText;
let values = document.querySelector(".values")

console.log(phase_status == "Waiting for match to start...")
switch (phase_status) {

  case "Waiting for match to start...":
      timer.start({countdown: true, startValues: {seconds: 10}});
  break;
  case "Affirmative opening arguments will start in:":
      timer.start({countdown: true, startValues: {seconds: 10}});
  break;
  case "Affirmative opening arguments":
      timer.start({countdown: true, startValues: {seconds: 480}});
  break;
  case "Negative cross examination preparation":
      timer.start({countdown: true, startValues: {seconds: 10}});
  break;
  case "Negative cross examination":
      timer.start({countdown: true, startValues: {seconds: 480}});
  break;
  case "Negative opening arguments":
      timer.start({countdown: true, startValues: {seconds: 480}});
  break;
  case "Affirmative cross examination preparation":
      timer.start({countdown: true, startValues: {seconds: 10}});
  break;
  case "Affirmative cross examination":
      timer.start({countdown: true, startValues: {seconds: 480}});
  break;
  case "Negative closing statements":
      timer.start({countdown: true, startValues: {seconds: 480}});
  break;
  case "Affirmative closing statements":
      timer.start({countdown: true, startValues: {seconds: 480}});
  break;
  case "Moderator giving final score...":
      timer.start({countdown: true, startValues: {seconds: 30}});
}

timer.addEventListener('secondsUpdated', (event) => {
  values.innerHTML = timer.getTimeValues().toString()
});
