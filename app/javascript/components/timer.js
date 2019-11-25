import { Timer } from 'easytimer.js';

const values = document.querySelector(".values");
const button = document.querySelector(".next-phase");
const timer = new Timer();

if (timer) {
    timer.addEventListener('secondsUpdated', (event) => {
        values.innerHTML = timer.getTimeValues().toString().split("").slice(3,8).join("")
    });

    timer.addEventListener('targetAchieved', (event) => {
        button.click();
    });
}

const setTimer = (timer, seconds) => {
    timer.start({countdown: true, startValues: {seconds: seconds}});
}

const initTimer = (phase) => {
    

    if (values){
        switch (phase) {
            case "waiting_start":
                setTimer(timer, 21);
            break;
            case "count_in":
                setTimer(timer, 121);
            break;
            case "affirmative_speech":
                    setTimer(timer, 21);
            break;
            case "negative_cross_examination_preparation":
                    setTimer(timer, 121);
            break;
            case "negative_cross_examination":
                    setTimer(timer, 21);
            break;
            case "negative_speech_preparation":
                    setTimer(timer, 121);
            break;
            case "negative_speech":
                    setTimer(timer, 31);
            break;
            case "affirmative_cross_examination_preparation":
                    setTimer(timer, 121);
            break;
            case "affirmative_cross_examination":
                    setTimer(timer, 11);
            break;
            case "affirmative_closing_statement_preparation":
                    setTimer(timer, 11);
            break;
            case "affirmative_closing_statement":
                    setTimer(timer, 61);
            break;
            case "negative_closing_statement_preparation":
                    setTimer(timer, 21);
            break;
            case "negative_closing_statement":
                    setTimer(timer, 61);
            break;
            case "waiting_end":
                    setTimer(timer, 31);
        }
    }
}


export {initTimer}

