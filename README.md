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
