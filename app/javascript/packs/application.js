import "bootstrap";
import 'components/timer';
import { initTimer } from 'components/timer';
import { initFlip } from 'components/flip';
import { initIconHover } from 'components/topic-show';

import { initLetter } from 'components/logo';
import { initPop } from 'components/logo';

import { submitForm } from 'components/argument-form';


initPop();
// initLetter();
initTimer();
initFlip();
initIconHover();



submitForm();

