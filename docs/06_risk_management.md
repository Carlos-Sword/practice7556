# Risk Management

| Risk | Effect | Mitigation |
|---|---|---|
| Air runs out too quickly | Robot cannot complete run | Increase storage pressure, reduce consumption, add regulator |
| Encoder spikes | Wrong RPM estimate | Use filtering and timeout-to-zero |
| Valve stuck open | Air loss or unsafe behavior | Default valve state closed |
| Raspberry Pi camera failure | Navigation fails | Add test code and simple fallback behavior |
| Steering clearance issue | Robot turns poorly | Calibrate servo and limit max angle |
| Battery voltage drops | Motors and Pi unstable | Monitor voltage and improve power system |
