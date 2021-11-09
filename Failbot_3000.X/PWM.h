#ifndef PWM_H
#define	PWM_H

#define MOTEUR_DROIT 0
#define MOTEUR_GAUCHE 1

void InitPWM(void);
/*void PWMSetSpeed(float, int);*/
void PWMUpdateSpeed(void);
void PWMSetSpeedConsigne(float, unsigned char);

#endif	/* PWM_H */

