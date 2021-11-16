#include <stdio.h>
#include <stdlib.h>
#include <xc.h>
#include "ChipConfig.h"
#include "IO.h"
#include "timer.h"
#include "PWM.h"

int main (void){
/***************************************************************************************************/
//Initialisation de l?oscillateur
/****************************************************************************************************/
InitOscillator();

/***************************************************************************************************/
//Initialisation des PWM
/****************************************************************************************************/

/****************************************************************************************************/
// Configuration des entrées sorties
/****************************************************************************************************/
InitIO();
InitPWM();

InitTimer23();
InitTimer1();

LED_BLANCHE = 1;
LED_BLEUE = 1;
LED_ORANGE = 1;

/****************************************************************************************************/
// Boucle Principale
/****************************************************************************************************/
while(1){
    if (ADCIsConversionFinished())
    {
        ADCClearConversionFinishedFlag();
        unsigned int * result = ADCGetResult();
        unsigned int ADCValue0 = result[0];
        unsigned int ADCValue1 = result[1];
        unsigned int ADCValue2 = result[2];
    }
}
}
