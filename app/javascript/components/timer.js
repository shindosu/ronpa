import Timer from 'easytimer.js';

let timer = new Timer();
let phase_status = document.querySelector(".phase-status")

switch (phase_status) {
  case "waiting start":
      timer.start({countdown: true, startValues: {seconds: 30}});
  break;
  case "count in":
      timer.start({countdown: true, startValues: {seconds: 10}});
  break;
}

let values = document.querySelector(".values")
const button = document.querySelector(".button")

timer.addEventListener('secondsUpdated', (event) => {
  values.innerHTML = timer.getTimeValues().toString()
});

timer.addEventListener('targetAchieved', (event) => {
  alert("Phase end")
})

button.addEventListener("click", (event) => {
  timer.stop();
})
