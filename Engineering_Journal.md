# WRO Future Engineers 2026 Engineering Journal

## 1. Team and Robot Overview

Team name: **The Primis**

Robot concept: self-driving robot using a pneumatic engine and an eCVT-style planetary transmission. The goal is to use pneumatic mechanical power while using electronic control and sensor feedback to stabilize the output speed.

## 2. Main Engineering Idea

The robot combines:

- Pneumatic engine
- Flywheel
- Planetary eCVT transmission
- Electric transmission control motor
- Encoder feedback
- Camera-based navigation
- Motion 2350 control system
- Raspberry Pi vision system

The pneumatic engine is difficult to control directly, so the eCVT system is used to control how power reaches the wheels.

## 3. Mechanical Design

The mechanical system includes the chassis, steering, drivetrain, pneumatic engine, flywheel, and eCVT transmission.

Important mechanical topics are documented in:

- `mechanical/pneumatic_engine.md`
- `mechanical/ecvt_transmission.md`
- `mechanical/gear_ratio_calculations.md`
- `mechanical/torque_speed_reasoning.md`

## 4. Electrical and Power System

The electrical system includes batteries, voltage regulators, boost converter, solenoid valve driver, Motion 2350 Pro, Raspberry Pi 3B+, and sensors.

Important electrical topics are documented in:

- `electrical/power_architecture.md`
- `electrical/battery_and_current_budget.md`
- `electrical/solenoid_valve_driver.md`
- `electrical/raspberry_pi_motion2350_uart.md`

## 5. Sensors

The robot uses sensors for navigation and drivetrain control:

- Camera for line and obstacle detection
- Flywheel encoder for pneumatic engine RPM
- Motor encoder for transmission/output RPM
- Distance sensors for side distance and parking
- Start button and LED indicators

## 6. Software Architecture

The software is split between:

- Raspberry Pi: camera processing and high-level vision decisions
- Motion 2350: motors, encoders, servo, solenoid valve, and real-time control

Important software topics are documented in:

- `software/software_architecture.md`
- `software/state_machine.md`
- `software/ecvt_control.md`
- `software/encoder_filtering.md`
- `software/uart_protocol.md`

## 7. Testing and Iteration

Testing is documented in:

- `testing/failure_log.md`
- `testing/pneumatic_runtime_tests.md`
- `testing/ecvt_neutral_tests.md`
- `testing/encoder_filter_tests.md`
- `testing/camera_uart_tests.md`

Robot versions are documented in:

- `iterations/`

## 8. Reproducibility

The repository is organized so another person can understand the design, view the code, inspect CAD/STL files, see wiring diagrams, and follow the testing history.
