import "bootstrap";
import 'components/topic-show';
import {initTimer} from 'components/timer';
import { initFlip } from 'components/flip';
import { initIconHover } from 'components/topic-show';

import { initLetter } from 'components/logo';
import { initPop } from 'components/logo';
import { submitForm } from 'components/argument-form';

// initPop();
initLetter();

// window.addEventListener('newPhaseStarted', (event) => {
//   initTimer(event.currentPhase);
// })

// initTimer('waiting_start');
initPop();
// initLetter();
initTimer();
initFlip();
initIconHover();



submitForm();

