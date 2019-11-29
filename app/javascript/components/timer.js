import { Timer } from 'easytimer.js';

const timer = new Timer();
if (timer) {
    timer.addEventListener('secondsUpdated', (event) => {
        const values = document.querySelector("#value");
        values.innerHTML = timer.getTimeValues().toString().split("").slice(3,8).join("")
    });

    timer.addEventListener('targetAchieved', (event) => {
    console.log('timer finished')
    //     // const button = document.getElementById("mod-end-turn-button");
    //     const endTurnForm = document.getElementById('end-turn-form');
    //     if (endTurnForm) {
    //             // endTurnForm.submit();
    //             console.log("button clicked!")
    //     } else {
    //             console.log('button not found')
    //     }
    });
}

const setTimer = (timer, seconds) => {
    timer.reset();
    timer.stop();
    timer.start({countdown: true, startValues: {seconds: seconds}});
}

const initTimer = (phase) => {
        const values = document.querySelector("#value");
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
                setTimer(timer, 11);
            break;
            case "affirmative_speech":
                    setTimer(timer, 121);
                break;
            case "negative_speech":
                    setTimer(timer, 121);
            break;
            case "affirmative_cross_examination":
                    setTimer(timer, 121);
            break;
            case "negative_cross_examination":
                    setTimer(timer, 121);
            break;
            case "affirmative_closing_statement":
                    setTimer(timer, 61);
            break;
            case "negative_closing_statement":
                    setTimer(timer, 61);
            break;
            case "waiting_end":
                    setTimer(timer, 61);
        }
    }
}


export {initTimer}

