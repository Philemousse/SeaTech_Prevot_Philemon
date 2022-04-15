#include <stdio.h>
#include <stdlib.h>
#include <xc.h>
#include <libpic30.h>
#include "ChipConfig.h"
#include "IO.h"
#include "timer.h"
#include "PWM.h"
#include "ADC.h"
#include "Robot.h"
#include "Toolbox.h"
#include "UART.h"
#include "CB_TX1.h"
#include "CB_RX1.h"
#include "main.h"

int main(void) {
    /***************************************************************************************************/
    //Initialisation de l'oscillateur
    /****************************************************************************************************/

    InitOscillator();

    /***************************************************************************************************/
    //Initialisation des PWM
    /****************************************************************************************************/

    InitIO();

    /***************************************************************************************************/
    //Initialisation des ADC
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
    InitTimer4();

    /****************************************************************************************************/
    // Initialisation de l'UART
    /****************************************************************************************************/

    InitUART();

    //    PWMSetSpeedConsigne(20, MOTEUR_DROIT);
    //    PWMSetSpeedConsigne(20, MOTEUR_GAUCHE);

    /****************************************************************************************************/
    // Configuration des entrées sorties
    /****************************************************************************************************/

    LED_BLANCHE = 1;
    LED_BLEUE = 1;
    LED_ORANGE = 1;

    /****************************************************************************************************/
    // Boucle Principale
    /****************************************************************************************************/
    while (1) {
        int i;
        for(i=0; i<CB_RX1_GetDataSize(); i++)
        {
            unsigned char c = CB_RX1_Get();
            SendMessage(&c,1);
        }
        __delay32(1000);
        //        if (ADCIsConversionFinished() == 1) {
        //            ADCClearConversionFinishedFlag();
        //            unsigned int * result = ADCGetResult();
        //            float volts = ((float) result[3])*3.3 / 4095 * 3.2;
        //            robotState.distanceTelemetreExtremeGauche = 34 / volts - 5;
        //            volts = ((float) result[2])*3.3 / 4095 * 3.2;
        //            robotState.distanceTelemetreCentre = 34 / volts - 5;            
        //            volts = ((float) result[0])*3.3 / 4095 * 3.2;
        //            robotState.distanceTelemetreExtremeDroit = 34 / volts - 5;
        //            volts = ((float) result[1])*3.3 / 4095 * 3.2;
        //            robotState.distanceTelemetreDroit = 34 / volts - 5;
        //            volts = ((float) result[4])*3.3 / 4095 * 3.2;
        //            robotState.distanceTelemetreGauche = 34 / volts - 5;
        //            
        //            if (robotState.distanceTelemetreDroit < 30)
        //                LED_ORANGE = 1;
        //            else
        //                LED_ORANGE = 0;
        //            if (robotState.distanceTelemetreCentre < 30)
        //                LED_BLEUE = 1;
        //            else
        //                LED_BLEUE = 0;
        //            if (robotState.distanceTelemetreGauche < 30)
        //                LED_BLANCHE = 1;
        //            else
        //                LED_BLANCHE = 0;
        //        }
    }
}

/****************************************************************************************************/
// Fonction OperatingSystemLoop de la machine d'états
/****************************************************************************************************/

unsigned char stateRobot;

void OperatingSystemLoop(void) {
    switch (stateRobot) {
        case STATE_ATTENTE:
            timestamp = 0;
            PWMSetSpeedConsigne(0, MOTEUR_DROIT);
            PWMSetSpeedConsigne(0, MOTEUR_GAUCHE);
            stateRobot = STATE_ATTENTE_EN_COURS;

        case STATE_ATTENTE_EN_COURS:
            SetNextRobotStateInAutomaticMode();
            break;

        case STATE_AVANCE:
            PWMSetSpeedConsigne(25, MOTEUR_DROIT);
            PWMSetSpeedConsigne(25, MOTEUR_GAUCHE);
            stateRobot = STATE_AVANCE_EN_COURS;
            break;

        case STATE_AVANCE_EN_COURS:
            SetNextRobotStateInAutomaticMode();
            break;

        case STATE_TOURNE_GAUCHE:
            PWMSetSpeedConsigne(15, MOTEUR_DROIT);
            PWMSetSpeedConsigne(-5, MOTEUR_GAUCHE);
            stateRobot = STATE_TOURNE_GAUCHE_EN_COURS;
            break;

        case STATE_TOURNE_GAUCHE_EN_COURS:
            SetNextRobotStateInAutomaticMode();
            break;

        case STATE_TOURNE_DROITE:
            PWMSetSpeedConsigne(-5, MOTEUR_DROIT);
            PWMSetSpeedConsigne(15, MOTEUR_GAUCHE);
            stateRobot = STATE_TOURNE_DROITE_EN_COURS;
            break;

        case STATE_TOURNE_DROITE_EN_COURS:
            SetNextRobotStateInAutomaticMode();
            break;

        case STATE_TOURNE_SUR_PLACE_GAUCHE:
            PWMSetSpeedConsigne(15, MOTEUR_DROIT);
            PWMSetSpeedConsigne(-15, MOTEUR_GAUCHE);
            stateRobot = STATE_TOURNE_SUR_PLACE_GAUCHE_EN_COURS;
            break;

        case STATE_TOURNE_SUR_PLACE_GAUCHE_EN_COURS:
            SetNextRobotStateInAutomaticMode();
            break;

        case STATE_TOURNE_SUR_PLACE_DROITE:
            PWMSetSpeedConsigne(-10, MOTEUR_DROIT);
            PWMSetSpeedConsigne(10, MOTEUR_GAUCHE);
            stateRobot = STATE_TOURNE_SUR_PLACE_DROITE_EN_COURS;
            break;

        case STATE_TOURNE_SUR_PLACE_DROITE_EN_COURS:
            SetNextRobotStateInAutomaticMode();
            break;
        
        case STATE_RECULE:
            PWMSetSpeedConsigne(-25, MOTEUR_DROIT);
            PWMSetSpeedConsigne(-25, MOTEUR_GAUCHE);
            stateRobot = STATE_RECULE_EN_COURS;
            break;
            
        case STATE_RECULE_EN_COURS:
            
            stateRobot = STATE_TOURNE_SUR_PLACE_GAUCHE;
            break;

        default:
            stateRobot = STATE_ATTENTE;
            break;
    }
}

unsigned char nextStateRobot = 0;

void SetNextRobotStateInAutomaticMode() {
    unsigned char positionObstacle = PAS_D_OBSTACLE;

    //Détermination de la position des obstacles en fonction des télémètres
    if (robotState.distanceTelemetreDroit < 35 &&
            robotState.distanceTelemetreCentre > 30 &&
            robotState.distanceTelemetreGauche > 35 &&
            robotState.distanceTelemetreExtremeDroit > 20 &&
            robotState.distanceTelemetreExtremeGauche > 20) //Obstacle à droite
        positionObstacle = OBSTACLE_A_DROITE;
    else if (robotState.distanceTelemetreDroit > 35 &&
            robotState.distanceTelemetreCentre > 30 &&
            robotState.distanceTelemetreGauche < 35 &&
            robotState.distanceTelemetreExtremeDroit > 20 &&
            robotState.distanceTelemetreExtremeGauche > 20) //Obstacle à gauche
        positionObstacle = OBSTACLE_A_GAUCHE;
    else if (robotState.distanceTelemetreDroit > 35 &&
            robotState.distanceTelemetreCentre < 30 &&
            robotState.distanceTelemetreGauche > 35 &&
            robotState.distanceTelemetreExtremeDroit > 20 &&
            robotState.distanceTelemetreExtremeGauche > 20) //Obstacle en face
        positionObstacle = OBSTACLE_EN_FACE;
    else if (robotState.distanceTelemetreDroit > 35 &&
            robotState.distanceTelemetreCentre > 30 &&
            robotState.distanceTelemetreGauche > 35 &&
            robotState.distanceTelemetreExtremeDroit > 20 &&
            robotState.distanceTelemetreExtremeGauche > 20) //pas d?obstacle
        positionObstacle = PAS_D_OBSTACLE;
    else if (robotState.distanceTelemetreDroit > 35 &&
            robotState.distanceTelemetreCentre > 30 &&
            robotState.distanceTelemetreGauche > 35 &&
            robotState.distanceTelemetreExtremeDroit < 20 &&
            robotState.distanceTelemetreExtremeGauche > 20) //obstacle extreme droit
        positionObstacle = OBSTACLE_EXTREME_DROITE;
    else if (robotState.distanceTelemetreDroit > 35 &&
            robotState.distanceTelemetreCentre > 30 &&
            robotState.distanceTelemetreGauche > 35 &&
            robotState.distanceTelemetreExtremeDroit > 20 &&
            robotState.distanceTelemetreExtremeGauche < 20) //obstacle extreme gauche
        positionObstacle = OBSTACLE_EXTREME_GAUCHE;
    else if (robotState.distanceTelemetreDroit < 35 &&
            robotState.distanceTelemetreCentre > 30 &&
            robotState.distanceTelemetreGauche > 35 &&
            robotState.distanceTelemetreExtremeDroit < 20 &&
            robotState.distanceTelemetreExtremeGauche > 20) //obstacle extreme droit + droit
        positionObstacle = OBSTACLE_A_DROITE;
    else if (robotState.distanceTelemetreDroit > 35 &&
            robotState.distanceTelemetreCentre > 30 &&
            robotState.distanceTelemetreGauche < 35 &&
            robotState.distanceTelemetreExtremeDroit > 20 &&
            robotState.distanceTelemetreExtremeGauche < 20) //obstacle extreme gauche + gauche
        positionObstacle = OBSTACLE_A_GAUCHE;
    else if (robotState.distanceTelemetreDroit > 35 &&
            robotState.distanceTelemetreCentre < 30 &&
            robotState.distanceTelemetreGauche > 35 &&
            robotState.distanceTelemetreExtremeDroit > 20 &&
            robotState.distanceTelemetreExtremeGauche < 20) //obstacle extreme gauche + centre
        positionObstacle = OBSTACLE_EXTREME_GAUCHE;
    else if (robotState.distanceTelemetreDroit > 35 &&
            robotState.distanceTelemetreCentre < 30 &&
            robotState.distanceTelemetreGauche > 35 &&
            robotState.distanceTelemetreExtremeDroit < 20 &&
            robotState.distanceTelemetreExtremeGauche > 20) //obstacle extreme droit + centre
        positionObstacle = OBSTACLE_EXTREME_DROITE;
    else if (robotState.distanceTelemetreDroit < 35 &&
            robotState.distanceTelemetreCentre < 30 &&
            robotState.distanceTelemetreGauche > 35 &&
            robotState.distanceTelemetreExtremeDroit > 20 &&
            robotState.distanceTelemetreExtremeGauche > 20) //obstacle droit + centre
        positionObstacle = OBSTACLE_A_DROITE;
    else if (robotState.distanceTelemetreDroit > 35 &&
            robotState.distanceTelemetreCentre < 30 &&
            robotState.distanceTelemetreGauche < 35 &&
            robotState.distanceTelemetreExtremeDroit > 20 &&
            robotState.distanceTelemetreExtremeGauche > 20) //obstacle gauche + centre
        positionObstacle = OBSTACLE_A_GAUCHE;
    else if (robotState.distanceTelemetreDroit < 35 &&
            robotState.distanceTelemetreCentre < 30 &&
            robotState.distanceTelemetreGauche > 35 &&
            robotState.distanceTelemetreExtremeDroit < 20 &&
            robotState.distanceTelemetreExtremeGauche > 20) //obstacle centre + extreme droit + droit
        positionObstacle = OBSTACLE_A_DROITE;
    else if (robotState.distanceTelemetreDroit > 35 &&
            robotState.distanceTelemetreCentre < 30 &&
            robotState.distanceTelemetreGauche < 35 &&
            robotState.distanceTelemetreExtremeDroit > 20 &&
            robotState.distanceTelemetreExtremeGauche < 20) //obstacle extreme gauche + gauche + centre
        positionObstacle = OBSTACLE_A_GAUCHE;
    else if (robotState.distanceTelemetreDroit < 35 &&
            robotState.distanceTelemetreCentre < 30 &&
            robotState.distanceTelemetreGauche < 35 &&
            robotState.distanceTelemetreExtremeDroit > 20 &&
            robotState.distanceTelemetreExtremeGauche > 20) //obstacle droit + centre + gauche
        positionObstacle = OBSTACLE_EN_FACE;
    else if (robotState.distanceTelemetreDroit > 35 &&
            robotState.distanceTelemetreCentre > 30 &&
            robotState.distanceTelemetreGauche < 35 &&
            robotState.distanceTelemetreExtremeDroit < 20 &&
            robotState.distanceTelemetreExtremeGauche > 20) //obstacle extreme droit + gauche
        positionObstacle = OBSTACLE_A_DROITE;
    else if (robotState.distanceTelemetreDroit < 35 &&
            robotState.distanceTelemetreCentre > 30 &&
            robotState.distanceTelemetreGauche > 35 &&
            robotState.distanceTelemetreExtremeDroit > 20 &&
            robotState.distanceTelemetreExtremeGauche < 20) //obstacle extreme gauche + droit
        positionObstacle = OBSTACLE_A_GAUCHE;
    else if (robotState.distanceTelemetreDroit < 35 &&
            robotState.distanceTelemetreCentre > 30 &&
            robotState.distanceTelemetreGauche < 35 &&
            robotState.distanceTelemetreExtremeDroit > 20 &&
            robotState.distanceTelemetreExtremeGauche > 20) //obstacle droit + gauche
        positionObstacle = OBSTACLE_EN_FACE;
    else if (robotState.distanceTelemetreDroit < 35 &&
            robotState.distanceTelemetreCentre > 30 &&
            robotState.distanceTelemetreGauche < 35 &&
            robotState.distanceTelemetreExtremeDroit > 20 &&
            robotState.distanceTelemetreExtremeGauche < 20) //obstacle extreme gauche + gauche + droit
        positionObstacle = OBSTACLE_A_GAUCHE;
    else if (robotState.distanceTelemetreDroit < 35 &&
            robotState.distanceTelemetreCentre > 30 &&
            robotState.distanceTelemetreGauche < 35 &&
            robotState.distanceTelemetreExtremeDroit < 20 &&
            robotState.distanceTelemetreExtremeGauche > 20) //obstacle extreme droit + droit + gauche
        positionObstacle = OBSTACLE_A_DROITE;
    else if (robotState.distanceTelemetreDroit < 35 &&
            robotState.distanceTelemetreCentre < 30 &&
            robotState.distanceTelemetreGauche > 35 &&
            robotState.distanceTelemetreExtremeDroit > 20 &&
            robotState.distanceTelemetreExtremeGauche < 20) //obstacle extreme gauche + droit + centre
        positionObstacle = OBSTACLE_A_GAUCHE;
    else if (robotState.distanceTelemetreDroit > 35 &&
            robotState.distanceTelemetreCentre < 30 &&
            robotState.distanceTelemetreGauche < 35 &&
            robotState.distanceTelemetreExtremeDroit < 20 &&
            robotState.distanceTelemetreExtremeGauche > 20) //obstacle extreme droit + gauche + centre
        positionObstacle = OBSTACLE_A_DROITE;
    else if (robotState.distanceTelemetreDroit > 35 &&
            robotState.distanceTelemetreCentre < 30 &&
            robotState.distanceTelemetreGauche < 35 &&
            robotState.distanceTelemetreExtremeDroit < 20 &&
            robotState.distanceTelemetreExtremeGauche < 20) //obstacle tout sauf droit
        positionObstacle = OBSTACLE_A_GAUCHE;
    else if (robotState.distanceTelemetreDroit < 35 &&
            robotState.distanceTelemetreCentre < 30 &&
            robotState.distanceTelemetreGauche > 35 &&
            robotState.distanceTelemetreExtremeDroit < 20 &&
            robotState.distanceTelemetreExtremeGauche < 20) //obstacle tout sauf gauche
        positionObstacle = OBSTACLE_A_DROITE;
    else if (robotState.distanceTelemetreDroit > 35 &&
            robotState.distanceTelemetreCentre > 30 &&
            robotState.distanceTelemetreGauche > 35 &&
            robotState.distanceTelemetreExtremeDroit < 20 &&
            robotState.distanceTelemetreExtremeGauche < 20) //obstacle extreme droit + extreme gauche
        positionObstacle = OBSTACLE_EN_FACE;
    else if (robotState.distanceTelemetreDroit > 35 &&
            robotState.distanceTelemetreCentre > 30 &&
            robotState.distanceTelemetreGauche < 35 &&
            robotState.distanceTelemetreExtremeDroit < 20 &&
            robotState.distanceTelemetreExtremeGauche < 20) //obstacle extreme droit + extreme gauche + gauche
        positionObstacle = OBSTACLE_EN_FACE;
    else if (robotState.distanceTelemetreDroit < 35 &&
            robotState.distanceTelemetreCentre > 30 &&
            robotState.distanceTelemetreGauche > 35 &&
            robotState.distanceTelemetreExtremeDroit < 20 &&
            robotState.distanceTelemetreExtremeGauche < 20) //obstacle extreme droit + droit + extreme gauche
        positionObstacle = OBSTACLE_EN_FACE;
    else if (robotState.distanceTelemetreDroit > 35 &&
            robotState.distanceTelemetreCentre < 30 &&
            robotState.distanceTelemetreGauche > 35 &&
            robotState.distanceTelemetreExtremeDroit < 20 &&
            robotState.distanceTelemetreExtremeGauche < 20) //obstacle extreme droit + centre + extreme gauche
        positionObstacle = OBSTACLE_EN_FACE;
    else if (robotState.distanceTelemetreDroit < 35 &&
            robotState.distanceTelemetreCentre > 30 &&
            robotState.distanceTelemetreGauche < 35 &&
            robotState.distanceTelemetreExtremeDroit < 20 &&
            robotState.distanceTelemetreExtremeGauche < 20) //obstacle tout sauf centre
        positionObstacle = OBSTACLE_EN_FACE;
    else if (robotState.distanceTelemetreDroit < 35 &&
            robotState.distanceTelemetreCentre < 30 &&
            robotState.distanceTelemetreGauche < 35 &&
            robotState.distanceTelemetreExtremeDroit < 20 &&
            robotState.distanceTelemetreExtremeGauche < 20) //obstacle tout
        positionObstacle = OBSTACLE_EN_FACE;

    //Détermination de l?état à venir du robot
    if (positionObstacle == PAS_D_OBSTACLE)
        nextStateRobot = STATE_AVANCE;
    else if (positionObstacle == OBSTACLE_A_DROITE)
        nextStateRobot = STATE_TOURNE_SUR_PLACE_GAUCHE;
    else if (positionObstacle == OBSTACLE_A_GAUCHE)
        nextStateRobot = STATE_TOURNE_SUR_PLACE_DROITE;
    else if (positionObstacle == OBSTACLE_EN_FACE)
        nextStateRobot = STATE_TOURNE_SUR_PLACE_GAUCHE;
    else if (positionObstacle == OBSTACLE_EXTREME_DROITE)
        nextStateRobot = STATE_TOURNE_GAUCHE;
    else if (positionObstacle == OBSTACLE_EXTREME_GAUCHE)
        nextStateRobot = STATE_TOURNE_DROITE;
    else if (positionObstacle == OBSTACLE_PARTOUT)
        nextStateRobot = STATE_RECULE;

    //Si l?on n?est pas dans la transition de l?étape en cours
    if (nextStateRobot != stateRobot - 1)
        stateRobot = nextStateRobot;
}

