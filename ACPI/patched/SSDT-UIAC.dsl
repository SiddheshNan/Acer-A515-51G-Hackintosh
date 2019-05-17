DefinitionBlock ("", "SSDT", 2, "hack", "UIAC-ALL", 0)
{
    Device(UIAC)
    {
        Name(_HID, "UIA00000")

        Name(RMCF, Package()
        {
            "XHC", Package()
            {
             // "port-count", Buffer() { 8, 0, 0, 0 },
                "ports", Package()
                {
                    "HS01", Package() // HS USB2 on USB3 Right
                    {
                        "UsbConnector", 0,
                      //  "portType", 0,
                        "port", Buffer() { 0x01, 0, 0, 0 },
                    },
                   "HS02", Package() // USB2 HUB
                    {
                        "UsbConnector", 0,
                       // "portType", 0,
                        "port", Buffer() { 0x02, 0, 0, 0 },
                    },
                    "HS03", Package() // USB2 Left 1st
                    {
                        "UsbConnector", 0,
                       // "portType", 0,
                        "port", Buffer() { 0x03, 0, 0, 0 },
                    },
                    "HS04", Package() // USB2 Left 2nd
                    {
                        "UsbConnector", 0,
                        //"portType", 0,
                        "port", Buffer() { 0x04, 0, 0, 0 },
                    },
                    "HS05", Package() // BT
                    {
                        "UsbConnector", 255,
                       // "portType", 0,
                        "port", Buffer() { 0x05, 0, 0, 0 },
                    },
                    "HS07", Package()
                    {
                        "UsbConnector", 255,
                      //  "portType", 0,
                        "port", Buffer() { 0x07, 0, 0, 0 },
                    },
                    "SS01", Package()  // SS USB3 on USB3 left
                    {
                        "UsbConnector", 3,
                      //  "portType", 0,
                        "port", Buffer() { 0x0a, 0, 0, 0 },
                    },
                    "SS02", Package()  // SS USB3 on type c left
                    {
                        "UsbConnector", 3,
                      //  "portType", 0,
                        "port", Buffer() { 0x0b, 0, 0, 0 },
                    },
                           },
            },
        })
    }

//
// Disabling EHCI #1
//
    External(_SB.PCI0, DeviceObj)
    External(_SB.PCI0.LPCB, DeviceObj)
    External(_SB.PCI0.EH01, DeviceObj)
    Scope(_SB.PCI0)
    {
        // registers needed for disabling EHC#1
        Scope(EH01)
        {
            OperationRegion(PSTS, PCI_Config, 0x54, 2)
            Field(PSTS, WordAcc, NoLock, Preserve)
            {
                PSTE, 2  // bits 2:0 are power state
            }
        }
        Scope(LPCB)
        {
            OperationRegion(RMLP, PCI_Config, 0xF0, 4)
            Field(RMLP, DWordAcc, NoLock, Preserve)
            {
                RCB1, 32, // Root Complex Base Address
            }
            // address is in bits 31:14
            OperationRegion(FDM1, SystemMemory, Add(And(RCB1,Not(Subtract(ShiftLeft(1,14),1))),0x3418), 4)
            Field(FDM1, DWordAcc, NoLock, Preserve)
            {
                ,15,    // skip first 15 bits
                FDE1,1, // should be bit 15 (0-based) (FD EHCI#1)
            }
        }
        Device(RMD1)
        {
            //Name(_ADR, 0)
            Name(_HID, "RMD10000")
            Method(_INI)
            {
                // disable EHCI#1
                // put EHCI#1 in D3hot (sleep mode)
                Store(3, ^^EH01.PSTE)
                // disable EHCI#1 PCI space
                Store(1, ^^LPCB.FDE1)
            }
        }
    }
}
//EOF