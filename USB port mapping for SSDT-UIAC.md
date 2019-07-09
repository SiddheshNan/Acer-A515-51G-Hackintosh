# USB Port Mappings for SSDT-UIAC


| USB 2.0   |          | USB 3.0   |          |
|-----------|----------|-----------|----------|
| Port NAME | Port ADR | Port NAME | Port ADR |
| HS01      | 1        | SS02      | 10       |
| HS02      | 2        | SS01      | 11       |
| HS03      | 3        |           |          |
| HS04      | 4        |           |          |
| HS05      | 5        |           |          |
| HS06      | 6        |           |          |
| HS07      | 7        |           |          |



### USB2 Ports on Right
- USB2 on Right HS03 @ 14300000
- USB2 on Right HS04 @ 14400000



### USB3 Port on Left

- USB2 on USB3 Left HS01 @ 14100000
- USB3 on USB3 Left SS01 @ 14d00000



### Type C / USB3.1

#### USB3 (Extension) on type C: SSO2 @ 14e00000
- USB 3.0 HUB @ 14e00000
- - AppleUSB30HubPort @ 14e1000
- - AppleUSB30HubPort @ 14e2000
- - AppleUSB30HubPort @ 14e3000
- - AppleUSB30HubPort @ 14e4000

#### USB2 (Extension) on type C: HSO2 @ 14200000
- - USB 2.0 HUB @ 14200000
- - AppleUSB20HubPort @ 1421000
- - AppleUSB20HubPort @ 1422000
- - AppleUSB20HubPort @ 1423000
- - AppleUSB20HubPort @ 1424000



### Webcam

#### Internal Webcam: HS07 @ 14700000
 - HD Webcam @ 14700000




### You can Find Patched SSDT-UIAC.dsl and SSDT-UIAC.aml under ACPI/Patched Folder.
 
 

