import { Timer } from 'easytimer.js';

    const timer = new Timer();
    let values = document.querySelector(".values");
    let button = document.querySelector(".next-phase");
    let phase_status = document.querySelector(".phase-text h3").innerText

        switch (phase_status) {
            case "Affirmative opening arguments will start in:":
                console.log(phase_status == "Affirmative opening arguments will start in:")
                timer.start({countdown: true, startValues: {seconds: 21}});
            break;
            case "Affirmative opening arguments":
                timer.start({countdown: true, startValues: {seconds: 121}});
            break;
            case "Negative cross examination preparation":
                timer.start({countdown: true, startValues: {seconds: 31}});
            break;
            case "Negative cross examination":
                timer.start({countdown: true, startValues: {seconds: 121}});
            break;
            case "Negative opening argument preparation":
                timer.start({countdown: true, startValues: {seconds: 21}});
            break;
            case "Negative opening arguments":
                timer.start({countdown: true, startValues: {seconds: 121}});
            break;
            case "Affirmative cross examination preparation":
                timer.start({countdown: true, startValues: {seconds: 31}});
            break;
            case "Affirmative cross examination":
                timer.start({countdown: true, startValues: {seconds: 121}});
            break;
            case "Affirmative closing statement prepatation":
                timer.start({countdown: true, startValues: {seconds: 11}});
            break;
            case "Affirmative closing statements":
                timer.start({countdown: true, startValues: {seconds: 61}});
            break;
            case "Negative closing statement preparation":
                timer.start({countdown: true, startValues: {seconds: 11}});
            break;
            case "Negative closing statements":
                timer.start({countdown: true, startValues: {seconds: 61}});
            break;
            case "Moderator giving final score...":
                timer.start({countdown: true, startValues: {seconds: 31}});
            }
        
            timer.addEventListener('secondsUpdated', (event) => {
              values.innerHTML = timer.getTimeValues().toString().split("").slice(3,8).join("")
            });
        
            timer.addEventListener('targetAchieved', (event) => {
              button.click();
            });

