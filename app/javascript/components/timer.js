import Timer from 'easytimer.js';

let timer = new Timer();

timer.start({countdown: true, startValues: {seconds: 61}});

let values = document.querySelector(".values")
const button = document.querySelector(".button")

timer.addEventListener('secondsUpdated', (event) => {
  values.innerHTML = timer.getTimeValues().toString()
});

timer.addEventListener('targetAchieved', (event) => {
  alert("Phase end")
})

button.addEventListener("click", (event) => {
  timer.reset();
})