import { Timer } from 'easytimer.js';

const timer = new Timer();
if (timer) {
    timer.addEventListener('secondsUpdated', (event) => {
        const values = document.querySelector("#value");
        values.innerHTML = timer.getTimeValues().toString().split("").slice(3,8).join("")
    });

    timer.addEventListener('targetAchieved', (event) => {
        const button = document.querySelector(".hvr-outline-in");
        button.click();
        console.log("button clicked!")
    });
}

const setTimer = (timer, seconds) => {
    timer.reset();
    timer.stop();
    timer.start({countdown: true, startValues: {seconds: seconds}});
}

const initTimer = (phase) => {
        const values = document.querySelector("#value");
        const button = document.querySelector(".hvr-outline-in");
    if (values){
        //     const timerDurations = {
        //             "count_in": 31,
        //             "affirmative_speech": 121,
        //             "negative_cross_examination_preparation": 21,
        //             "negative_cross_examination": 121,
        //             "negative_speech_preparation": 21,
        //             "negative_speech": 121,
        //             "affirmative_cross_examination_preparation": 21
        //
        //
        //
        //
        //
        //
        //
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

