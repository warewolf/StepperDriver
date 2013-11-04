#include <StepperDriver.h>

const int stepsPerRevolution = 200; // change this to fit the number of steps per revolution for your motor
StepperDriver myStepper; //initialize for one stepper

int dirPin = 0;
int stepPin = 1;
int microStep=16
int enablePin = 14;

void setup() {
  pinMode(enablePin, OUTPUT);
  digitalWrite(enablePin, LOW)
  myStepper.setStep(stepsPerRevolution, dirPin,stepPin);
  myStepper.setSpeed(microStep); //with 1/8th stepping turned on, 1 rpm * 8 = 8
  myStepper.step(stepsPerRevolution*microStep); //with 1/8 stepping turned on, one full revolution needs to be multiplied x 8
  
}

void loop() {
// step one revolution in one direction:

  if (myStepper.update() == 1){ //here we check to see if the motor has finished the last step command and at the same time call the update for the motor to keep running
    delay(1000); //when a full revolution is complete, wait 1second and do another full rev.
    myStepper.step(stepsPerRevolution*microStep);
  }
}
