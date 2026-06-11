#!/bin/bash

# WRO FE 2026 Repository Setup Script
# Repo: The-primis
# Purpose: Create a judge-friendly GitHub structure and add retrospective daily logs from the physical engineering notebook.

echo "Creating WRO FE 2026 repository structure..."

# -----------------------------
# MAIN FOLDERS
# -----------------------------

mkdir -p notebook_scans
mkdir -p daily_logs
mkdir -p docs
mkdir -p mechanical/CAD/fusion360_files
mkdir -p mechanical/CAD/step_files
mkdir -p mechanical/CAD/old_versions
mkdir -p mechanical/STL/chassis_parts
mkdir -p mechanical/STL/transmission_parts
mkdir -p mechanical/STL/steering_parts
mkdir -p mechanical/STL/sensor_mounts
mkdir -p mechanical/photos/chassis
mkdir -p mechanical/photos/steering
mkdir -p mechanical/photos/drivetrain
mkdir -p mechanical/photos/pneumatic_engine
mkdir -p mechanical/photos/ecvt

mkdir -p electrical/diagrams
mkdir -p electrical/photos/electronics_layout
mkdir -p electrical/photos/battery_system
mkdir -p electrical/photos/solenoid_driver
mkdir -p electrical/photos/wiring

mkdir -p sensors/calibration_data
mkdir -p sensors/photos/camera_mount
mkdir -p sensors/photos/distance_sensors
mkdir -p sensors/photos/flywheel_encoder
mkdir -p sensors/photos/motor_encoder

mkdir -p software/motion_2350/libraries
mkdir -p software/raspberry_pi
mkdir -p software/flowcharts

mkdir -p testing/data
mkdir -p testing/videos/open_challenge
mkdir -p testing/videos/obstacle_challenge
mkdir -p testing/videos/ecvt_tests
mkdir -p testing/videos/encoder_tests
mkdir -p testing/videos/pneumatic_tests

mkdir -p iterations
mkdir -p media/robot_photos
mkdir -p media/team_photos/working_session_photos
mkdir -p media/diagrams
mkdir -p media/videos/testing_clips
mkdir -p old_template_backup

# -----------------------------
# ROOT FILES
# -----------------------------

cat > README.md <<'EOF'
# The Primis - WRO Future Engineers 2026

## Team

We are **The Primis**, a WRO Future Engineers team from Puerto Rico.

## Robot Concept

Our robot is a self-driving vehicle designed for the WRO Future Engineers challenge. The main engineering idea is to combine a **pneumatic engine** with an **eCVT-style planetary transmission**. The pneumatic engine provides mechanical power, while an electric motor and encoder feedback help control the transmission output.

## Main Systems

- Pneumatic engine and air storage system
- eCVT planetary transmission
- Steering servo
- Cytron Motion 2350 Pro for motor, encoder, valve, and servo control
- Raspberry Pi 3B+ for camera processing
- UART communication between Raspberry Pi and Motion 2350
- Flywheel encoder
- Motor encoder
- Distance sensors
- Solenoid valve and boost converter

## Repository Map

| Folder | Purpose |
|---|---|
| `notebook_scans/` | Scans of the physical engineering notebook |
| `daily_logs/` | Day-by-day work logs, including retrospective logs from the notebook |
| `docs/` | Team overview, strategy, design decisions, risks, and reproducibility |
| `mechanical/` | Chassis, steering, drivetrain, pneumatic engine, eCVT, CAD, STL |
| `electrical/` | Power system, wiring, batteries, solenoid driver, regulators |
| `sensors/` | Camera, encoders, distance sensors, calibration |
| `software/` | Motion 2350 and Raspberry Pi code |
| `testing/` | Test plans, failures, data, and videos |
| `iterations/` | Past robot versions and design evolution |
| `media/` | Final photos, diagrams, and videos |

## Main Documentation

- [Engineering Journal](Engineering_Journal.md)
- [Bill of Materials](BOM.md)
- [Changelog](CHANGELOG.md)
- [Failure Log](testing/failure_log.md)
- [Design Decisions](docs/04_design_decisions.md)
- [Reproducibility Guide](docs/07_reproducibility_guide.md)

## Current Development Goals

1. Organize the full engineering documentation.
2. Digitize the physical notebook into GitHub logs.
3. Improve the pneumatic engine and air storage system.
4. Develop and test the eCVT neutral hold and constant output control.
5. Integrate Raspberry Pi camera processing with the Motion 2350.
6. Build a reliable state-machine robot for open challenge, obstacle challenge, and parking.
EOF

cat > Engineering_Journal.md <<'EOF'
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
EOF

cat > BOM.md <<'EOF'
# Bill of Materials

| Part | Quantity | Purpose | Voltage | Current | Weight | Cost | Notes |
|---|---:|---|---:|---:|---:|---:|---|
| Cytron Motion 2350 Pro | 1 | Main motor/control board | 7.4 V | TBD | TBD | TBD | Controls motors, servo, encoders, and valve |
| Raspberry Pi 3B+ | 1 | Vision processing | 5 V | TBD | 42 g noted in notebook | TBD | Handles camera processing |
| Raspberry Pi Camera | 1 | Track and obstacle detection | 5 V | TBD | 4 g noted in notebook | TBD | Ribbon camera |
| 7.4 V Battery | 1 or more | Main power | 7.4 V | TBD | 213 g noted in notebook | TBD | Battery system still being developed |
| Pneumatic engine | 1 | Mechanical power source | Air powered | N/A | 120 g noted in notebook | TBD | LEGO pneumatic engine |
| Air tank | Multiple | Air storage | N/A | N/A | TBD | TBD | Notebook includes air storage calculations |
| Solenoid valve | 1 | Controls air to engine | 12 V | 0.6-0.7 A measured later | 20 g noted in notebook | TBD | Closed when signal is HIGH, open when LOW |
| Regulator | 1 | Regulates pneumatic pressure | N/A | N/A | 200 g noted in notebook | TBD | Used for controlled pressure |
| Boost converter | 1 | Raises 7.4 V to 12 V | 7.4 V to 12 V | TBD | TBD | TBD | Powers solenoid valve |
| eCVT motor | 1 | Controls transmission ratio | 7.4 V | TBD | 180 g noted in notebook | TBD | Electric control motor |
| Steering servo | 1 | Steering | 5-6 V | TBD | 40 g noted in notebook | TBD | Steering calibrated later |
| H-bridge / motor driver | 1 | Motor driving | TBD | TBD | 20 g noted in notebook | TBD | Motor control |
| Optical encoder sensor | 2 | RPM measurement | 3.3/5 V | TBD | 15-30 g | TBD | Flywheel and motor RPM |
| Lines and fittings | Multiple | Pneumatic connections | N/A | N/A | 20 g noted in notebook | TBD | Air system plumbing |
| Schrader valve | 1 | Fill air tanks | N/A | N/A | 15 g noted in notebook | TBD | Used to fill air storage |
EOF

cat > CHANGELOG.md <<'EOF'
# Changelog

## 2026-06-10

### Added
- Created WRO FE 2026 GitHub repository structure.
- Added retrospective daily logs digitized from the physical engineering notebook.
- Added folders for mechanical, electrical, sensors, software, testing, iterations, and media.
- Added Bill of Materials.
- Added Engineering Journal.
- Added notebook scan folder.

### Changed
- Organized previous documentation into a structure that matches the WRO FE engineering rubric.

### Notes
- Older entries are retrospective logs created from the physical notebook. They are marked clearly in each file.
EOF

cat > LICENSE <<'EOF'
This repository is for WRO Future Engineers documentation and educational use by Team The Primis.
EOF

# -----------------------------
# NOTEBOOK SCANS
# -----------------------------

cat > notebook_scans/README.md <<'EOF'
# Notebook Scans

This folder contains scans of the physical engineering notebook.

The notebook was digitized into Markdown files inside:

- `daily_logs/`
- `iterations/`
- `mechanical/`
- `testing/`
- `docs/`

The original scan should be uploaded here as:

`CamScanner_2026-06-10_engineering_notebook.pdf`
EOF

# -----------------------------
# DAILY LOGS
# -----------------------------

cat > daily_logs/README.md <<'EOF'
# Daily Logs

This folder contains daily engineering logs.

Some logs are **retrospective logs**. That means they were written later from the physical engineering notebook and digitized into GitHub.
EOF

cat > daily_logs/template_daily_log.md <<'EOF'
# Daily Log - YYYY-MM-DD

> Retrospective log: This entry was digitized from the physical engineering notebook on 2026-06-10.

## Goal

## Work Completed

## Problems Found

## Test Results

## Changes Made

## Photos / Videos

## Next Step
EOF

cat > daily_logs/2026-02-20.md <<'EOF'
# Daily Log - 2026-02-20

> Retrospective log: This entry was digitized from the physical engineering notebook on 2026-06-10.

## Topic
First concept introduction: eCVT and pneumatic efficiency.

## Goal
Develop the first concept for a transmission that could use a pneumatic engine more efficiently.

## Work Completed
- Proposed the idea of using a pneumatic engine to move the robot.
- Proposed combining pneumatic power with an electric motor through a transmission.
- Identified that pneumatic engines are hard to control directly.
- Started thinking about using a planetary transmission to combine outputs.

## Main Idea
The pneumatic engine would be connected to one input of the planetary system, and an electric motor would influence or control the other input. The combined output would go to the wheels.

## Problems Found
- Pneumatic power is difficult to control.
- The engine needs to work in a useful RPM range.
- The robot needs both speed and torque.
- Air consumption may be a limiting factor.

## Next Step
Investigate planetary transmission layouts and decide how the pneumatic engine, electric motor, and output should connect.
EOF

cat > daily_logs/2026-02-20_navigation.md <<'EOF'
# Daily Log - 2026-02-20 Navigation

> Retrospective log: This entry was digitized from the physical engineering notebook on 2026-06-10.

## Topic
First navigation system notes.

## Goal
Define the first idea for how the robot would navigate the WRO Future Engineers field.

## Work Completed
- Proposed that the robot would use sensors to detect the field and obstacles.
- Identified the need for autonomous movement.
- Identified that electronics would require a battery.
- Started separating the robot into mechanical, electronic, and navigation systems.

## Problems Found
- The navigation system was still unclear.
- Sensor choice and placement still needed to be tested.
- The robot needed a reliable control system before advanced behavior could be added.

## Next Step
Continue defining the electronics and sensor architecture.
EOF

cat > daily_logs/2026-02-20_meeting_1.md <<'EOF'
# Daily Log - 2026-02-20 Meeting 1

> Retrospective log: This entry was digitized from the physical engineering notebook on 2026-06-10.

## Topic
Team idea and solution brainstorming.

## Ideas Discussed
- Use a variable transmission.
- Use a pneumatic motor.
- Use an electric motor for transmission control.
- Compare pneumatic and electric motor behavior.
- Consider the need for more torque at low speed.

## Notes
The team discussed that the robot needed a system that could control speed and torque more efficiently than a fixed gear drivetrain.

## Components Mentioned
- Pneumatic motor
- Electric motor
- Transmission
- Battery
- Sensors
- H-bridge / motor driver

## Next Step
Research planetary transmissions and continue developing the eCVT idea.
EOF

cat > daily_logs/2026-02-22.md <<'EOF'
# Daily Log - 2026-02-22

> Retrospective log: This entry was digitized from the physical engineering notebook on 2026-06-10.

## Topic
E-CVT V1: first planetary transmission design.

## Goal
Create the first practical version of the eCVT planetary transmission.

## Work Completed
- Designed the first planetary transmission concept.
- Considered using a Fusion 360 planetary design as a reference.
- Defined the major parts of the system:
  - Sun gear
  - Planet gears
  - Ring gear
  - Planet carrier
- Identified that the output should come from the planet carrier.

## Main Design Idea
The transmission would use the pneumatic engine and an electric motor as separate inputs. The planetary system would combine the motion and send controlled output to the wheels.

## Problems Found
- The first design had issues with how the inputs and output were assigned.
- The team needed to change the input arrangement so the electric motor could control the ring gear and the output could come from the carrier.

## Next Step
Develop E-CVT V2 with corrected input/output arrangement.
EOF

cat > daily_logs/2026-02-22_ecvt_v2.md <<'EOF'
# Daily Log - 2026-02-22 E-CVT V2

> Retrospective log: This entry was digitized from the physical engineering notebook on 2026-06-10.

## Topic
E-CVT V2 gear ratio calculations.

## Goal
Calculate a better planetary gearset for the eCVT.

## Work Completed
- Calculated gear tooth counts for a compact planetary transmission.
- Used module 2 gears as a reference.
- Considered a pressure angle of 20 degrees.
- Wrote gear quantities for ring, sun, planet, and outside ring.
- Considered the outside ring gear ratio to the electric motor.

## Gear Notes From Notebook
- Ring gear considered around 48 teeth.
- Sun gear considered around 12 teeth.
- Planet gear considered around 18 teeth.
- Outside ring gear considered around 60 teeth.
- A 6:1 outside ring to motor concept was noted.

## Problems Found
- The exact gearset needed to be compact but still strong.
- The carrier needed enough space for the planets and bearings.
- The transmission needed to be manufacturable and efficient.

## Next Step
Continue refining gear ratios and build a physical or CAD proof of concept.
EOF

cat > daily_logs/2026-02-22_air_supply.md <<'EOF'
# Daily Log - 2026-02-22 Air Supply Conflict

> Retrospective log: This entry was digitized from the physical engineering notebook on 2026-06-10.

## Topic
Air supply conflict for pneumatic motor.

## Goal
Find a practical way to supply compressed air to the pneumatic engine.

## Problem
The pneumatic engine needs enough air to run for the required time. The notebook identifies that the motor must run at the same time as the robot and that air consumption is a major limitation.

## Option 1
Use soda bottles inflated to the pressure needed for the engine.

### Pros
- Lightweight
- Simple
- Cheap

### Cons
- Hard to maintain pressure
- Fast consumption of pressure
- Safety and consistency concerns

## Option 2
Use high pressure lightweight tanks with a regulator.

### Pros
- More air stored in the same displacement
- More stable pressure supply to the engine

### Cons
- More weight because of the regulator and fittings
- More expensive
- Harder to find components

## Decision Direction
The high pressure tank and regulator system is more complex, but it gives better control and more usable air than low-pressure bottles.

## Next Step
Estimate runtime and weight for the high pressure air storage system.
EOF

cat > daily_logs/2026-02-24.md <<'EOF'
# Daily Log - 2026-02-24

> Retrospective log: This entry was digitized from the physical engineering notebook on 2026-06-10.

## Topic
Weight estimate.

## Goal
Estimate the total weight of the electronics, chassis, and air system.

## Work Completed
The notebook lists weights for major components.

## Weight Notes From Notebook

### Electronics
- Raspberry Pi 3B+: 42 g
- Raspberry Pi camera: 4 g
- Battery: 213 g
- eCVT motor: 180 g
- Servo: 40 g
- H-bridge: 20 g
- Estimated electronics total: about 652 g

### Air System
- Tank group: 156 g
- Regulator: 200 g
- E-valve: 20 g
- Lines and fittings: 20 g
- Pneumatic engine: 120 g
- Schrader valve: 15 g
- T-fitting: 20 g
- Estimated air system total: about 595 g

## Problems Found
- Weight is a major design constraint.
- The regulator and air system add significant weight.
- The design must balance runtime, pressure, and total mass.

## Next Step
Continue reducing weight and compare the weight of each system to its performance benefit.
EOF

cat > daily_logs/2026-02-24_car_sketch.md <<'EOF'
# Daily Log - 2026-02-24 Car Sketch

> Retrospective log: This entry was digitized from the physical engineering notebook on 2026-06-10.

## Topic
First car sketch.

## Goal
Sketch a possible layout for the robot.

## Work Completed
- Created an early top-view sketch of the robot.
- Began thinking about where the drivetrain, pneumatic engine, and electronics could fit.
- Considered the need for compact packaging.

## Problems Found
- The robot has many subsystems that must fit in a small chassis.
- Pneumatic tanks, drivetrain, electronics, and sensors all compete for space.

## Next Step
Develop a cleaner chassis layout and place components based on weight balance and accessibility.
EOF

cat > daily_logs/2026-02-26.md <<'EOF'
# Daily Log - 2026-02-26

> Retrospective log: This entry was digitized from the physical engineering notebook on 2026-06-10.

## Topic
Development of E-CVT V4.

## Goal
Improve the planetary transmission design.

## Work Completed
- Designed a version of the planetary transmission using:
  - Internal ring gear
  - External ring gear
  - Planet gears
  - Sun gear
- Proposed a system where the pneumatic engine drives the sun gear.
- Proposed that an electric motor drives the outside ring gear.
- Proposed that the planet carrier becomes the output to the wheels.

## Main Design Idea
The pneumatic motor powers the sun gear. The electric motor controls the ring gear through the outside ring. The planet carrier sends power to the wheels.

## Why This Matters
This design gives the robot a way to control output speed while the pneumatic engine is running.

## Problems Found
- The transmission must be compact.
- The planets and bearings must fit inside the ring gear.
- The gear design must be strong enough for load.

## Next Step
Create a proof of concept and continue testing gear spacing.
EOF

cat > daily_logs/2026-02-28_pneumatic_engine.md <<'EOF'
# Daily Log - 2026-02-28 Pneumatic Engine

> Retrospective log: This entry was digitized from the physical engineering notebook on 2026-06-10.

## Topic
Pneumatic engine design.

## Goal
Design a pneumatic engine with better torque and smoother operation.

## Work Completed
- Designed a two-crank pneumatic engine concept.
- Considered using multiple pistons connected to a common output.
- Noted that the pistons should be connected in a way that improves torque delivery.
- Considered the direction of airflow and valve timing.

## Problems Found
- Pneumatic engines can have dead spots.
- The engine may need a flywheel to smooth power output.
- Torque and speed must be balanced.
- Air consumption is a major limitation.

## Next Step
Test the pneumatic engine and measure runtime, RPM, and torque behavior.
EOF

cat > daily_logs/2026-02-28_air_storage.md <<'EOF'
# Daily Log - 2026-02-28 Air Storage Problem

> Retrospective log: This entry was digitized from the physical engineering notebook on 2026-06-10.

## Topic
Air storage problem.

## Goal
Calculate whether the air storage system can run long enough for the robot.

## Test Result From Notebook
The V1 engine ran for about 7 seconds with a tank volume of about 237 cm³ at 40 psi.

## Calculation Notes
- Tank volume: 237 cm³
- Runtime at 40 psi: about 7 seconds
- Absolute pressure was considered by adding atmospheric pressure.
- A later calculation estimated that increasing pressure and using multiple tanks could increase runtime.

## Problem
The first air system did not store enough air for the competition run.

## Engineering Meaning
The pneumatic engine is possible, but the air system must be improved. More pressure, more tanks, a regulator, and reduced air consumption may be needed.

## Next Step
Test higher pressure storage and calculate runtime with multiple tanks.
EOF

cat > daily_logs/2026-03-02.md <<'EOF'
# Daily Log - 2026-03-02

> Retrospective log: This entry was digitized from the physical engineering notebook on 2026-06-10.

## Topic
Brainstorming gear ratios.

## Goal
Plan how the eCVT could control neutral, forward, and reverse behavior.

## Work Completed
- Defined the need to control the vehicle speed using RPM information.
- Proposed using the engine RPM as a sensor input.
- Proposed that gear ratio control should allow the robot to be:
  - In neutral
  - Moving forward
  - Reversing or reducing output
- Sketched how the electric motor could influence output speed.

## Main Idea
Instead of a fixed gear ratio, the transmission should use sensor feedback to control the output.

## Problems Found
- The system needs accurate RPM sensing.
- The control motor must respond correctly to pneumatic engine speed.
- Neutral behavior is important for starting the pneumatic engine without moving the car.

## Next Step
Add encoder feedback and test neutral hold behavior.
EOF

cat > daily_logs/2026-03-04.md <<'EOF'
# Daily Log - 2026-03-04

> Retrospective log: This entry was digitized from the physical engineering notebook on 2026-06-10.

## Topic
Sponsor presentation planning.

## Goal
Prepare a sponsor presentation for the school/community.

## Work Completed
- Listed the introduction topics.
- Planned to explain who the team is and what the goal is.
- Planned to explain what had already been achieved.
- Planned to mention the use of pneumatic motor, electric motor, Fusion 360, 3D printing, and a camera system.
- Planned to explain what components were still needed.
- Planned to ask how the sponsor could help the team reach the goal.

## Main Message
The team has already developed major parts of the robot and needs support to complete the remaining components and final chassis.

## Next Step
Create a cleaner sponsor presentation and include robot diagrams, cost table, and final motivation message.
EOF

cat > daily_logs/2026-03-21_engine_v2.md <<'EOF'
# Daily Log - 2026-03-21 Engine V2

> Retrospective log: This entry was digitized from the physical engineering notebook on 2026-06-10.

## Topic
Pneumatic Engine V2.

## Goal
Improve the pneumatic engine after testing the first version.

## Work Completed
- Designed Engine V2 using the same concept as V1 but with a more compact and lighter structure.
- Planned to improve torque at low speed.
- Considered using a flywheel to make the engine smoother.
- Considered connecting the crankshafts so both sides contribute to one output.

## Main Design Idea
The new engine should reduce weight and friction while keeping enough torque to drive the eCVT system.

## Problems Found
- The first engine was not efficient enough.
- The engine needed smoother operation.
- Low-speed torque was more important than high-speed output.
- The flywheel adds weight but helps smooth the power pulses.

## Next Step
Build and test Engine V2 with the flywheel and measure RPM, runtime, and torque behavior.
EOF

cat > daily_logs/2026-06-10.md <<'EOF'
# Daily Log - 2026-06-10

## Goal
Digitize the physical engineering notebook and create a professional GitHub structure for WRO Future Engineers 2026.

## Work Completed
- Scanned the physical notebook.
- Created GitHub folder structure.
- Added retrospective daily logs from the notebook.
- Added folders for mechanical, electrical, sensors, software, testing, iterations, and media.
- Added the Engineering Journal, BOM, and Changelog.

## Problems Found
- Some notebook pages are hard to read clearly.
- Some handwritten notes need to be summarized instead of copied word-for-word.
- Older work must be labeled honestly as retrospective documentation.

## Changes Made
- Added `notebook_scans/`.
- Added `daily_logs/`.
- Added `iterations/`.
- Added testing and failure tracking.

## Next Step
Upload the notebook PDF to `notebook_scans/` and start filling the mechanical, electrical, and software explanation files.
EOF

# -----------------------------
# DOCS
# -----------------------------

cat > docs/README.md <<'EOF'
# Docs

This folder contains polished written explanations for judges.

Use this folder for strategy, design decisions, systems thinking, risk management, and reproducibility.
EOF

cat > docs/01_team_and_robot_overview.md <<'EOF'
# Team and Robot Overview

## Team
Team name: The Primis

## Robot
The robot is a WRO Future Engineers self-driving vehicle using a pneumatic engine and an eCVT-style planetary transmission.

## Main Innovation
The robot combines air-powered mechanical energy with electronic transmission control. This allows the pneumatic engine to run while the electric motor helps control the output speed through the planetary transmission.
EOF

cat > docs/02_competition_strategy.md <<'EOF'
# Competition Strategy

## Open Challenge
The robot must drive around the field reliably without obstacles.

## Obstacle Challenge
The robot must detect obstacles and choose the correct path around them.

## Parking
The robot will use sensors and programmed logic to stop inside the parking area.

## Main Priority
Reliability comes first. The robot must drive consistently before advanced features are added.
EOF

cat > docs/03_rules_compliance.md <<'EOF'
# Rules Compliance

This file will document how the robot follows the WRO Future Engineers 2026 rules.

## Items to Check
- Robot dimensions
- Allowed controllers
- Allowed sensors
- Battery safety
- Pneumatic system safety
- Autonomous operation
- Documentation requirements
EOF

cat > docs/04_design_decisions.md <<'EOF'
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
EOF

cat > docs/05_systems_thinking.md <<'EOF'
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
EOF

cat > docs/06_risk_management.md <<'EOF'
# Risk Management

| Risk | Effect | Mitigation |
|---|---|---|
| Air runs out too quickly | Robot cannot complete run | Increase storage pressure, reduce consumption, add regulator |
| Encoder spikes | Wrong RPM estimate | Use filtering and timeout-to-zero |
| Valve stuck open | Air loss or unsafe behavior | Default valve state closed |
| Raspberry Pi camera failure | Navigation fails | Add test code and simple fallback behavior |
| Steering clearance issue | Robot turns poorly | Calibrate servo and limit max angle |
| Battery voltage drops | Motors and Pi unstable | Monitor voltage and improve power system |
EOF

cat > docs/07_reproducibility_guide.md <<'EOF'
# Reproducibility Guide

This guide explains how another person could understand and rebuild the robot.

## Required Information
- Mechanical CAD and STL files
- Wiring diagrams
- Bill of materials
- Software files
- Sensor calibration
- Test results
- Photos of final robot

## Build Steps
1. Build chassis.
2. Install steering system.
3. Install pneumatic engine.
4. Install eCVT transmission.
5. Install electronics and power system.
6. Install sensors.
7. Upload Motion 2350 code.
8. Run Raspberry Pi camera code.
9. Calibrate sensors.
10. Run test plan.
EOF

cat > docs/08_sponsor_presentation_notes.md <<'EOF'
# Sponsor Presentation Notes

These notes were digitized from the physical engineering notebook.

## Presentation Topics
- Team introduction
- What the robot is
- What we have already achieved
- Use of pneumatic motor
- Use of electric motor
- Use of Fusion 360
- Use of 3D printing
- Use of a camera system
- What components are needed
- How sponsorship helps the team reach the goal

## Main Message
The team has developed most of the system and needs support for remaining components, testing, and final chassis development.
EOF

cat > docs/09_final_reflection.md <<'EOF'
# Final Reflection

This file will be completed closer to competition.

## Topics to Include
- What worked best
- What failed
- What changed
- What the team learned
- What would be improved in the future
EOF

# -----------------------------
# MECHANICAL
# -----------------------------

cat > mechanical/README.md <<'EOF'
# Mechanical System

This folder documents the physical design of the robot: chassis, steering, drivetrain, pneumatic engine, eCVT, gear ratios, CAD, STL files, and photos.
EOF

cat > mechanical/chassis_design.md <<'EOF'
# Chassis Design

The chassis must fit the pneumatic system, eCVT transmission, electronics, sensors, and batteries while staying compact and stable.

## Design Goals
- Low center of gravity
- Easy access to batteries and electronics
- Strong mounting for the drivetrain
- Good sensor visibility
- Enough space for air tanks and regulator
EOF

cat > mechanical/steering_system.md <<'EOF'
# Steering System

The steering system uses a servo.

## Notes
- Servo connected to GP4 on the Motion 2350.
- Steering center was calibrated mechanically.
- Maximum steering angle must avoid mechanical interference.
- Right turn clearance issue was noted during testing, so steering limits should be documented.
EOF

cat > mechanical/drivetrain.md <<'EOF'
# Drivetrain

The drivetrain sends power from the eCVT output to the wheels.

## Power Path
Pneumatic engine -> flywheel -> sun gear  
Electric motor -> outside ring gear  
Planet carrier -> differential/wheels
EOF

cat > mechanical/pneumatic_engine.md <<'EOF'
# Pneumatic Engine

The robot uses a LEGO-style pneumatic engine as a mechanical power source.

## Engine Concept
The engine uses pneumatic pistons connected to crankshafts to produce rotary motion.

## Development Notes
- Early engine versions had low runtime.
- A flywheel was considered to smooth power pulses.
- Engine V2 was planned to be lighter and more compact than V1.
- Low-speed torque is more important than high-speed output.

## Air Storage Issue
Notebook testing showed about 7 seconds of runtime using a 237 cm³ tank at 40 psi. This made air storage one of the main engineering problems.
EOF

cat > mechanical/ecvt_transmission.md <<'EOF'
# eCVT Transmission

The eCVT is the main mechanical innovation of the robot.

## Concept
The eCVT uses a planetary transmission to combine pneumatic engine power and electric motor control.

## Power Path
- Pneumatic engine drives the sun gear.
- Electric motor drives the outside ring gear.
- Planet carrier is the output to the wheels.

## Purpose
The pneumatic engine is difficult to control directly. The eCVT allows the robot to stabilize or control the output speed by changing the motion of the ring gear.

## Important Behaviors
- Neutral hold
- Controlled launch
- Constant carrier output speed
- Compensation based on flywheel and motor encoder RPM
EOF

cat > mechanical/gear_ratio_calculations.md <<'EOF'
# Gear Ratio Calculations

## Notebook Gear Concepts

Early notes considered:
- Ring gear around 48 teeth
- Sun gear around 12 teeth
- Planet gear around 18 teeth
- Outside ring gear around 60 teeth
- Outside ring to motor ratio concept around 6:1

## Later Design Notes
Later testing and design work should update this file with the final gear counts and measured RPM behavior.

## Current Required Values
- Sun gear teeth:
- Planet gear teeth:
- Internal ring teeth:
- External ring teeth:
- Motor gear teeth:
- Flywheel ratio:
- Differential ratio:
EOF

cat > mechanical/torque_speed_reasoning.md <<'EOF'
# Torque and Speed Reasoning

## Problem
The robot needs enough torque to move reliably, but also enough speed to complete the challenge.

## Pneumatic Engine Behavior
The pneumatic engine may produce better torque at low speed but is limited by air consumption.

## Why eCVT Helps
The eCVT allows the robot to control the output speed instead of being locked to one fixed gear ratio.

## Design Goal
Use the pneumatic engine in a useful RPM range while controlling the carrier output speed electronically.
EOF

cat > mechanical/mechanical_iterations.md <<'EOF'
# Mechanical Iterations

This file summarizes major mechanical changes.

## Early Concept
Pneumatic engine with a transmission concept.

## E-CVT V1
First planetary layout.

## E-CVT V2
Gear ratio calculations and corrected input/output thinking.

## E-CVT V4
Improved concept: pneumatic engine drives sun gear, electric motor drives ring gear, carrier outputs to wheels.

## Engine V2
More compact and lighter pneumatic engine with flywheel support.
EOF

# -----------------------------
# ELECTRICAL
# -----------------------------

cat > electrical/README.md <<'EOF'
# Electrical System

This folder documents power, wiring, batteries, regulators, solenoid valve driver, Raspberry Pi, Motion 2350, and safety states.
EOF

cat > electrical/power_architecture.md <<'EOF'
# Power Architecture

## Main Power System
The robot uses a battery system to power motors, electronics, and sensors.

## Subsystems
- Motion 2350 Pro
- Raspberry Pi 3B+
- Motors
- Servo
- Sensors
- Solenoid valve
- Boost converter

## Solenoid Valve Power
The valve requires 12 V, so a boost converter is used when the main battery voltage is lower.
EOF

cat > electrical/battery_and_current_budget.md <<'EOF'
# Battery and Current Budget

| Component | Voltage | Current | Notes |
|---|---:|---:|---|
| Motion 2350 Pro | 7.4 V | TBD | Main control board |
| Raspberry Pi 3B+ | 5 V | TBD | Camera processing |
| Solenoid valve | 12 V | 0.6-0.7 A | Measured later in testing |
| Motors | 7.4 V | TBD | Drive/eCVT motors |
| Servo | 5-6 V | TBD | Steering |
| Sensors | 3.3/5 V | TBD | Camera, encoders, distance sensors |

## Notes
The notebook includes a component weight estimate, but current measurements should be added as testing continues.
EOF

cat > electrical/wiring_diagram.md <<'EOF'
# Wiring Diagram

Final wiring diagram should be placed in:

`electrical/diagrams/full_wiring_diagram.png`

## Main Connections
- Motion 2350 to motors
- Motion 2350 to servo
- Motion 2350 to encoders
- Motion 2350 to solenoid driver
- Raspberry Pi to camera
- Raspberry Pi to Motion 2350 through UART
EOF

cat > electrical/solenoid_valve_driver.md <<'EOF'
# Solenoid Valve Driver

## Valve Behavior
- Signal HIGH: valve closed
- Signal LOW: valve open

## Safety
The safe default state is valve closed.

## Driver Concept
The Motion 2350 signal controls a MOSFET/gate driver circuit that switches the 12 V solenoid valve.
EOF

cat > electrical/raspberry_pi_motion2350_uart.md <<'EOF'
# Raspberry Pi and Motion 2350 UART

## Purpose
The Raspberry Pi handles camera processing and sends commands to the Motion 2350.

## Motion 2350 Role
- Motor control
- Steering servo
- Encoder reading
- Solenoid valve control
- Real-time control loop

## Raspberry Pi Role
- Camera processing
- Color/obstacle detection
- High-level command generation

## UART Notes
Document TX, RX, GND, baud rate, and message format here.
EOF

cat > electrical/voltage_regulators.md <<'EOF'
# Voltage Regulators

This file documents all buck and boost converters.

## Needed Voltages
- 5 V for Raspberry Pi
- 7.4 V battery system for motors/controller
- 12 V for solenoid valve

## Notes
The valve requires a boost converter if the main battery is below 12 V.
EOF

cat > electrical/safety_and_fail_states.md <<'EOF'
# Safety and Fail States

## Safe States
- Motors stop at program end.
- Valve ends closed.
- Encoder timeout sets RPM to zero.
- Robot should not move during boot.
- Pneumatic engine should not open valve unless start sequence is active.
EOF

# -----------------------------
# SENSORS
# -----------------------------

cat > sensors/README.md <<'EOF'
# Sensors

This folder documents all sensors, calibration, placement, and test data.
EOF

cat > sensors/camera_system.md <<'EOF'
# Camera System

The camera is used for track and obstacle detection.

## Purpose
- Detect field direction
- Detect colored objects
- Support obstacle challenge behavior
EOF

cat > sensors/raspberry_pi_camera.md <<'EOF'
# Raspberry Pi Camera

The Raspberry Pi 3B+ handles the camera system.

## Known Working Concept
Use Picamera2 for camera preview and image capture.

## To Document
- Camera model
- Resolution
- Frame rate
- Lighting issues
- Detection thresholds
EOF

cat > sensors/distance_sensors.md <<'EOF'
# Distance Sensors

Distance sensors are planned for side distance and parking.

## Uses
- Wall distance
- Parking alignment
- Recovery behavior
EOF

cat > sensors/flywheel_encoder.md <<'EOF'
# Flywheel Encoder

The flywheel encoder measures pneumatic engine RPM.

## Notes
- Encoder disk uses 16 slots.
- RPM is calculated from pulse timing.
- Timeout-to-zero is used when the flywheel stops.
EOF

cat > sensors/motor_encoder.md <<'EOF'
# Motor Encoder

The motor encoder measures motor or transmission output RPM.

## Notes
- Encoder disk uses 9 holes.
- Motor encoder output must account for gear ratio.
- Later tests used division by 39.6 for output RPM from the motor encoder system.
EOF

cat > sensors/button_and_leds.md <<'EOF'
# Button and LEDs

## Button
Used to start the robot program.

## LEDs
Used for robot status feedback.
EOF

cat > sensors/calibration.md <<'EOF'
# Sensor Calibration

## Camera
Add camera threshold and detection calibration here.

## Encoders
Add pulse count, timeout, filtering, and RPM calculation notes.

## Distance Sensors
Add measured distance vs sensor reading tables.

## Servo
Add steering center and max left/right values.
EOF

cat > sensors/sensor_placement_reasoning.md <<'EOF'
# Sensor Placement Reasoning

Each sensor must be placed where it gives useful readings without being blocked.

## Camera
Mounted to see the track and obstacles.

## Encoders
Mounted close to rotating shafts or disks.

## Distance Sensors
Mounted on sides or front depending on strategy.
EOF

# -----------------------------
# SOFTWARE
# -----------------------------

cat > software/README.md <<'EOF'
# Software

This folder contains both code and explanations.

## Main Subfolders
- `motion_2350/`: MicroPython code for Cytron Motion 2350 Pro
- `raspberry_pi/`: Python code for Raspberry Pi 3B+
- `flowcharts/`: diagrams of logic and state machines
EOF

cat > software/software_architecture.md <<'EOF'
# Software Architecture

## Raspberry Pi
Handles camera processing and sends commands through UART.

## Motion 2350
Handles motors, encoders, servo, solenoid valve, and drivetrain control.

## Why Split the System
The Raspberry Pi is better for vision. The Motion 2350 is better for real-time motor and sensor control.
EOF

cat > software/state_machine.md <<'EOF'
# State Machine

## Planned States

1. BOOT
2. WAIT_FOR_BUTTON
3. START_PNEUMATIC_ENGINE
4. ECVT_NEUTRAL_HOLD
5. DRIVE_OPEN_CHALLENGE
6. DRIVE_OBSTACLE_CHALLENGE
7. AVOID_OBSTACLE
8. RECOVER
9. PARK
10. STOP_SAFE

## Purpose
The state machine keeps the robot behavior organized instead of using random if-statements.
EOF

cat > software/open_challenge_strategy.md <<'EOF'
# Open Challenge Strategy

The open challenge focuses on reliable driving without obstacles.

## Goals
- Stable steering
- Avoid touching walls
- Complete laps consistently
- Keep drivetrain behavior predictable
EOF

cat > software/obstacle_strategy.md <<'EOF'
# Obstacle Strategy

The robot must detect obstacles and choose the correct side to pass.

## To Document
- How red obstacles are handled
- How green obstacles are handled
- How the robot recovers after avoiding an obstacle
EOF

cat > software/parking_strategy.md <<'EOF'
# Parking Strategy

Parking will use sensor data and a final state-machine behavior.

## To Document
- How the parking area is detected
- How the robot aligns
- How the robot stops safely
EOF

cat > software/ecvt_control.md <<'EOF'
# eCVT Control

## Goal
Control the output of the planetary eCVT using encoder feedback.

## Important Behaviors
- Neutral hold
- Constant carrier output speed
- Compensation based on flywheel RPM
- Compensation based on motor/output RPM

## Notes
The notebook shows that the team planned neutral, forward, and reverse/transmission behavior based on RPM sensing.
EOF

cat > software/encoder_filtering.md <<'EOF'
# Encoder Filtering

## Problem
Encoder readings can have spikes or false dips.

## Solutions Tested
- Average filtering
- Median filtering
- Timeout-to-zero

## Goal
Make RPM readings stable enough for eCVT control.
EOF

cat > software/uart_protocol.md <<'EOF'
# UART Protocol

## Purpose
The Raspberry Pi sends vision decisions to the Motion 2350.

## Example Messages
- DRIVE_LEFT
- DRIVE_RIGHT
- CENTER
- OBSTACLE_LEFT
- OBSTACLE_RIGHT
- STOP

Final message format should be documented here.
EOF

# Software placeholder files
cat > software/motion_2350/README.md <<'EOF'
# Motion 2350 Code

This folder contains MicroPython code for the Cytron Motion 2350 Pro.
EOF

touch software/motion_2350/main.py
touch software/motion_2350/motor_test.py
touch software/motion_2350/encoder_test.py
touch software/motion_2350/flywheel_encoder_test.py
touch software/motion_2350/motor_encoder_test.py
touch software/motion_2350/solenoid_test.py
touch software/motion_2350/servo_test.py
touch software/motion_2350/uart_receive_test.py
touch software/motion_2350/ecvt_neutral_hold_test.py
touch software/motion_2350/ecvt_constant_output_test.py
touch software/motion_2350/libraries/motor.py
touch software/motion_2350/libraries/servo.py
touch software/motion_2350/libraries/led.py
touch software/motion_2350/libraries/voltage.py

cat > software/raspberry_pi/README.md <<'EOF'
# Raspberry Pi Code

This folder contains Python code for the Raspberry Pi 3B+ camera and UART system.
EOF

touch software/raspberry_pi/camera_test.py
touch software/raspberry_pi/camera_preview.py
touch software/raspberry_pi/vision_processing.py
touch software/raspberry_pi/color_detection.py
touch software/raspberry_pi/obstacle_detection.py
touch software/raspberry_pi/uart_to_motion2350.py
touch software/raspberry_pi/main_pi.py

# -----------------------------
# TESTING
# -----------------------------

cat > testing/README.md <<'EOF'
# Testing

This folder contains test plans, results, failures, data, and videos.
EOF

cat > testing/test_plan.md <<'EOF'
# Test Plan

## Required Tests
- Pneumatic engine runtime
- eCVT neutral hold
- Constant carrier output
- Encoder filtering
- Camera detection
- UART communication
- Steering calibration
- Open challenge driving
- Obstacle challenge driving
- Parking
EOF

cat > testing/failure_log.md <<'EOF'
# Failure Log

## Problem 001: Pneumatic runtime too short

### Date
2026-02-28, digitized later from notebook.

### What happened
The V1 pneumatic engine ran for about 7 seconds using a 237 cm³ tank at 40 psi.

### Cause
Air storage was too limited and the engine consumed air quickly.

### Fix Ideas
- Increase storage pressure.
- Use multiple tanks.
- Add a regulator.
- Improve engine efficiency.
- Reduce friction and leaks.

### Status
Still an important design risk.

---

## Problem 002: eCVT layout needed input/output correction

### Date
2026-02-22, digitized later from notebook.

### What happened
Early eCVT design needed corrections to the input and output arrangement.

### Cause
The first planetary layout did not clearly give the electric motor useful control over the transmission output.

### Fix
Developed later eCVT versions where the pneumatic engine drives the sun gear, the electric motor drives the ring gear, and the carrier is the output.

### Status
Improved through V2/V4 design work.

---

## Problem 003: Weight of air system

### Date
2026-02-24, digitized later from notebook.

### What happened
The air system added significant weight due to tanks, regulator, valve, fittings, and pneumatic engine.

### Cause
Pneumatic systems need storage and control hardware.

### Fix Ideas
- Use lighter tanks.
- Reduce fittings.
- Use compact engine design.
- Evaluate whether each component is worth its weight.

### Status
Requires continuous weight tracking.
EOF

cat > testing/problem_solution_log.md <<'EOF'
# Problem Solution Log

| Problem | Cause | Solution / Test | Status |
|---|---|---|---|
| Pneumatic runtime too short | Small air volume / high consumption | Higher pressure tanks and regulator | In progress |
| eCVT layout unclear | Early planetary concept needed correction | Use sun/ring/carrier layout | Improved |
| Air system heavy | Tanks/regulator/fittings add weight | Track weight and reduce parts | In progress |
| Encoder noise | Sensor readings can spike | Filtering and timeout-to-zero | In progress |
EOF

cat > testing/pneumatic_runtime_tests.md <<'EOF'
# Pneumatic Runtime Tests

## Test 1: V1 Air Storage

### Date
2026-02-28, digitized later from notebook.

### Setup
- Tank volume: about 237 cm³
- Pressure: 40 psi
- Engine: Pneumatic engine V1

### Result
- Runtime: about 7 seconds

### Conclusion
The V1 air storage setup did not provide enough runtime. The air system needs more stored air, higher pressure, regulation, or reduced air consumption.
EOF

cat > testing/ecvt_neutral_tests.md <<'EOF'
# eCVT Neutral Tests

This file will document tests where the pneumatic engine can spin while the robot output stays near zero RPM.

## To Record
- Flywheel RPM
- Motor RPM
- Carrier/output RPM
- M1 duty
- M2 duty
- Error
- Stability
EOF

cat > testing/ecvt_constant_output_tests.md <<'EOF'
# eCVT Constant Output Tests

This file will document tests where the robot tries to hold a target carrier/output RPM.

## To Record
- Target carrier RPM
- Actual carrier RPM
- Flywheel RPM
- Motor RPM
- PWM values
- Error over time
EOF

cat > testing/encoder_filter_tests.md <<'EOF'
# Encoder Filter Tests

## Goal
Compare filtering methods for RPM stability.

## Methods
- Raw RPM
- Average filter
- Median filter
- Timeout-to-zero

## Notes
Later testing showed that false encoder dips and spikes can affect control, so filtering is required.
EOF

cat > testing/open_challenge_tests.md <<'EOF'
# Open Challenge Tests

Record open challenge driving tests here.

| Date | Test Goal | Result | Problems | Next Step |
|---|---|---|---|---|
EOF

cat > testing/obstacle_challenge_tests.md <<'EOF'
# Obstacle Challenge Tests

Record obstacle challenge tests here.

| Date | Test Goal | Result | Problems | Next Step |
|---|---|---|---|---|
EOF

cat > testing/parking_tests.md <<'EOF'
# Parking Tests

Record parking tests here.

| Date | Test Goal | Result | Problems | Next Step |
|---|---|---|---|---|
EOF

cat > testing/camera_uart_tests.md <<'EOF'
# Camera and UART Tests

Record Raspberry Pi camera and UART communication tests here.

| Date | Test Goal | Result | Problems | Next Step |
|---|---|---|---|---|
EOF

cat > testing/battery_runtime_tests.md <<'EOF'
# Battery Runtime Tests

Record battery voltage, current draw, and runtime tests here.

| Date | Battery | Start Voltage | End Voltage | Runtime | Notes |
|---|---|---:|---:|---:|---|
EOF

cat > testing/steering_tests.md <<'EOF'
# Steering Tests

Record steering servo tests here.

## Notes
- Steering center must be calibrated.
- Max steering angle must avoid mechanical interference.
- Right turn clearance issues should be documented.
EOF

# Data placeholders
touch testing/data/pneumatic_runtime.csv
touch testing/data/ecvt_neutral_results.csv
touch testing/data/carrier_rpm_tests.csv
touch testing/data/encoder_filter_results.csv
touch testing/data/battery_voltage_tests.csv
touch testing/data/lap_times.csv
touch testing/data/obstacle_success_rate.csv

# -----------------------------
# ITERATIONS
# -----------------------------

cat > iterations/README.md <<'EOF'
# Iterations

This folder shows the robot's evolution over time.

Old versions are included because they prove the engineering process: problems were found, designs changed, and the robot improved.
EOF

cat > iterations/version_1_initial_concept.md <<'EOF'
# Version 1 - Initial Concept

## Date
2026-02-20, digitized later from notebook.

## Main Idea
Create a WRO Future Engineers robot using pneumatic power and an electric transmission concept.

## What Worked
- The team identified a unique engineering direction.
- The concept connected pneumatic power with transmission control.

## Problems
- Pneumatic power was hard to control.
- The drivetrain concept was not yet defined.
- Runtime was unknown.

## Next Version Goal
Design a practical planetary eCVT transmission.
EOF

cat > iterations/version_2_pneumatic_engine_concept.md <<'EOF'
# Version 2 - Pneumatic Engine Concept

## Main Idea
Use a pneumatic engine as the robot's mechanical power source.

## What Worked
- The pneumatic engine gave the robot a unique mechanical system.
- Multiple-piston and crank concepts were explored.

## Problems
- Air consumption was high.
- Engine torque and speed needed improvement.
- Flywheel support might be required.

## Next Version Goal
Create a transmission that can make the pneumatic engine more controllable.
EOF

cat > iterations/version_3_ecvt_v1.md <<'EOF'
# Version 3 - E-CVT V1

## Date
2026-02-22, digitized later from notebook.

## Main Idea
First planetary transmission design.

## What Worked
- Identified sun, planet, ring, and carrier structure.
- Began planning how two inputs could combine into one output.

## Problems
- Input/output arrangement needed correction.
- Gear spacing and manufacturability were not solved.

## Next Version Goal
Correct the planetary layout and calculate better gear ratios.
EOF

cat > iterations/version_4_ecvt_v2.md <<'EOF'
# Version 4 - E-CVT V2/V4

## Dates
2026-02-22 to 2026-02-26, digitized later from notebook.

## Main Idea
Improve the eCVT with corrected gear assignments.

## Design Direction
- Pneumatic engine drives the sun gear.
- Electric motor drives the outside ring gear.
- Planet carrier sends power to wheels.

## What Improved
- Better control concept.
- Better definition of power path.
- Gear ratio calculations started.

## Problems
- Transmission needed to stay compact.
- Bearings and planets needed to fit.
- Final gear ratio still needed testing.
EOF

cat > iterations/version_5_air_storage_redesign.md <<'EOF'
# Version 5 - Air Storage Redesign

## Date
2026-02-28, digitized later from notebook.

## Problem
The early air storage test only gave about 7 seconds of runtime.

## Main Change
The team considered higher pressure tanks, multiple tanks, and a regulator.

## Why This Version Matters
Air storage became one of the biggest engineering constraints. Without enough air, the pneumatic engine cannot complete the run.

## Next Version Goal
Improve air storage, reduce leaks, and test engine efficiency.
EOF

cat > iterations/version_6_raspberry_pi_camera_integration.md <<'EOF'
# Version 6 - Raspberry Pi Camera Integration

## Main Idea
Use a Raspberry Pi 3B+ for camera processing and the Motion 2350 for robot control.

## Why This Change Was Made
Camera processing is better handled by the Raspberry Pi, while the Motion 2350 is better for motor control, encoders, servo, and solenoid timing.

## Next Version Goal
Create stable UART communication between the Raspberry Pi and Motion 2350.
EOF

cat > iterations/version_7_current_robot.md <<'EOF'
# Version 7 - Current Robot

## Main Idea
Current robot combines:

- Pneumatic engine
- eCVT planetary transmission
- Motion 2350 control
- Raspberry Pi camera processing
- Encoders
- Solenoid valve
- Steering servo
- Distance sensors

## Current Goals
- Reliable driving
- Stable steering
- eCVT neutral hold
- Constant carrier output control
- Camera detection
- Obstacle behavior
- Parking
EOF

cat > iterations/decision_matrix.md <<'EOF'
# Decision Matrix

| Decision | Option A | Option B | Chosen | Reason |
|---|---|---|---|---|
| Power source | Electric only | Pneumatic + electric control | Pneumatic + electric control | Unique system and strong engineering challenge |
| Vision system | Motion 2350 only | Raspberry Pi + Motion 2350 | Raspberry Pi + Motion 2350 | Pi handles camera better |
| Air storage | Soda bottles | High pressure tanks + regulator | High pressure tanks + regulator | Better pressure stability |
| Transmission | Fixed gears | eCVT planetary | eCVT planetary | Allows output control |
| Speed sensing | No feedback | Encoder feedback | Encoder feedback | Needed for control |
EOF

# -----------------------------
# MEDIA
# -----------------------------

cat > media/README.md <<'EOF'
# Media

This folder contains final photos, videos, diagrams, and working-session media.
EOF

# -----------------------------
# EMPTY README FILES FOR CAD/STL
# -----------------------------

cat > mechanical/CAD/README.md <<'EOF'
# CAD Files

Place Fusion 360 files, STEP files, and old CAD versions here.
EOF

cat > mechanical/STL/README.md <<'EOF'
# STL Files

Place 3D-printable files here.

Organize by:
- chassis parts
- transmission parts
- steering parts
- sensor mounts
EOF

echo "Repository structure and notebook logs created."
echo "Next steps:"
echo "1. Upload the scanned notebook PDF to notebook_scans/"
echo "2. Run: git add ."
echo "3. Run: git commit -m \"Add WRO FE 2026 documentation structure and notebook logs\""
echo "4. Run: git push"