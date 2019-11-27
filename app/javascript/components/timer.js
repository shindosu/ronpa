import { Timer } from 'easytimer.js';

const values = document.querySelector("#value");
const button = document.querySelector(".next-phase");
const timer = new Timer();
console.log("i am outside of the if statement")
if (timer) {
    timer.addEventListener('secondsUpdated', (event) => {
        values.innerHTML = timer.getTimeValues().toString().split("").slice(3,8).join("")
    });

    timer.addEventListener('targetAchieved', (event) => {
        button.click();
    });
    console.log("i am inside if timer")
}

const setTimer = (timer, seconds) => {
        console.log("i am inside of setTimer and when the phase is right I am recognized")
    timer.reset();
    timer.stop();
    timer.start({countdown: true, startValues: {seconds: seconds}});
}

const initTimer = (phase) => {

    if (values){
            console.log(`I am inside if (values) and am logging ${value}`)
            console.log(phase)

        //     const timerDurations = {
        //             "count_in": 31,
        //             "affirmative_speech": 121
        //     }

        //     setTimer(timer, timerDurations[phase])
        switch (phase) {
            case "count_in":
                setTimer(timer, 31);
            break;
            case "affirmative_speech":
                    setTimer(timer, 121);
            case "negative_cross_examination_preparation":
                    setTimer(timer, 21);
            break;
            case "negative_cross_examination":
                    setTimer(timer, 121);
            break;
            case "negative_speech_preparation":
                    setTimer(timer, 21);
            break;
            case "negative_speech":
                    setTimer(timer, 121);
            break;
            case "affirmative_cross_examination_preparation":
                    setTimer(timer, 21);
            break;
            case "affirmative_cross_examination":
                    setTimer(timer, 121);
            break;
            case "affirmative_closing_statement_preparation":
                    setTimer(timer, 11);
            break;
            case "affirmative_closing_statement":
                    setTimer(timer, 61);
            break;
            case "negative_closing_statement_preparation":
                    setTimer(timer, 11);
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

