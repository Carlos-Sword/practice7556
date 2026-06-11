# Systems Thinking

The robot is a combination of mechanical, electrical, sensor, and software systems.

## Mechanical and Electrical Interaction
The pneumatic engine provides power, but the electric control motor affects the transmission output.

## Sensor and Software Interaction
Encoders measure RPM so the software can estimate and control the eCVT behavior.

## Power and Safety Interaction
The solenoid valve requires 12 V and must default to a safe closed state.

## Vision and Control Interaction
The Raspberry Pi processes the camera image and sends commands to the Motion 2350 through UART.
