import "bootstrap";
import 'components/topic-show';
import { initTimer } from 'components/timer';
import { initFlip } from 'components/flip';
import { initIconHover } from 'components/topic-show';
import { initLetter } from 'components/logo';
import { initPop } from 'components/logo';
import { submitForm } from 'components/argument-form';
import { feedbackButtonActiveTan } from 'components/feedback-button';
import { feedbackButtonActiveRed } from 'components/feedback-button';
// import { removeCallButton } from 'components/join_call';
// import { giveFeedback } from 'components/review-button';

window.addEventListener('newPhaseStarted', (event) => {
  console.log(event)
  initTimer(event.currentPhase);
})

// removeCallButton();
initLetter();
initFlip();
initIconHover();
submitForm();
feedbackButtonActiveTan();
feedbackButtonActiveRed();
// giveFeedback();


