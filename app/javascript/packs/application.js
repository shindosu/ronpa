import "bootstrap";
import 'components/topic-show';
import {initTimer} from 'components/timer';
import { initFlip } from 'components/flip';
import { initIconHover } from 'components/topic-show';
import { initLetter } from 'components/logo';
import { initPop } from 'components/logo';
import { submitForm } from 'components/argument-form';
// import { giveFeedback } from 'components/review-button';

window.addEventListener('newPhaseStarted', (event) => {
  console.log(event)
  initTimer(event.currentPhase);
})

initLetter();
initFlip();
initIconHover();
submitForm();
// giveFeedback();

