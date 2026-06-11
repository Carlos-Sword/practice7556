# Software Architecture

## Raspberry Pi
Handles camera processing and sends commands through UART.

## Motion 2350
Handles motors, encoders, servo, solenoid valve, and drivetrain control.

## Why Split the System
The Raspberry Pi is better for vision. The Motion 2350 is better for real-time motor and sensor control.
