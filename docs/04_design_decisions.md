# Design Decisions

## Decision 1: Use a pneumatic engine
The team wanted a unique drivetrain that used compressed air as a power source.

## Decision 2: Add an eCVT transmission
The pneumatic engine is difficult to control directly. The eCVT allows the robot to control output speed by using an electric motor to influence the planetary transmission.

## Decision 3: Use encoder feedback
Fixed PWM does not guarantee fixed RPM. Encoder feedback allows the robot to measure real speed and compensate.

## Decision 4: Use Raspberry Pi and Motion 2350
The Raspberry Pi is better for camera processing, while the Motion 2350 is better for motor control, encoder reading, servo control, and solenoid control.

## Decision 5: Use high pressure storage with regulation
The notebook showed that low-pressure air storage had limited runtime. A higher pressure system with regulation gives more usable air.
