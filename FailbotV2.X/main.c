#include <stdio.h>
#include <stdlib.h>
#include <xc.h>
#include "ChipConfig.h"
#include "IO.h"
#include "timer.h"
#include "PWM.h"
#include "ADC.h"
#include "Robot.h"
#include "Toolbox.h"

int main (void){
/***************************************************************************************************/
//Initialisation de l'oscillateur
/****************************************************************************************************/

InitOscillator();

/***************************************************************************************************/
//Initialisation des PWM
/****************************************************************************************************/

InitIO();

/***************************************************************************************************/
//Initialisation des PWM
/****************************************************************************************************/

InitADC1();

/***************************************************************************************************/
//Initialisation des PWM
/****************************************************************************************************/

InitPWM();

/****************************************************************************************************/
// Initialisation des timers
/****************************************************************************************************/

InitTimer23();
InitTimer1();

/****************************************************************************************************/
// Configuration des entrées sorties
/****************************************************************************************************/

LED_BLANCHE = 1;
LED_BLEUE = 1;
LED_ORANGE = 1;

/****************************************************************************************************/
// Boucle Principale
/****************************************************************************************************/
while(1){
    if (ADCIsConversionFinished() == 1)
    {
        ADCClearConversionFinishedFlag();
        unsigned int * result = ADCGetResult();
        float volts = ((float) result[2])*3.3 / 4095 * 3.2;
        robotState.distanceTelemetreGauche = 34 / volts - 5;
        volts = ((float) result[1])*3.3 / 4095 * 3.2;
        robotState.distanceTelemetreCentre = 34 / volts - 5;
        volts = ((float) result[0])*3.3 / 4095 * 3.2;
        robotState.distanceTelemetreDroit = 34 / volts - 5;
        if (robotState.distanceTelemetreDroit < 30)
        {
            LED_ORANGE = !LED_ORANGE;
        }
        if (robotState.distanceTelemetreCentre < 30)
        {
            LED_BLEUE = !LED_BLEUE;
        }
        if (robotState.distanceTelemetreGauche < 30)
        {
            LED_BLANCHE = !LED_BLANCHE;
        }
    }
}
}
