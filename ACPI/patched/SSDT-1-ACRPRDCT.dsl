/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-1-ACRPRDCT.aml, Wed Jan  9 06:21:38 2019
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000BC8 (3016)
 *     Revision         0x02
 *     Checksum         0xFC
 *     OEM ID           "ACRSYS"
 *     OEM Table ID     "ACRPRDCT"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "1025"
 *     Compiler Version 0x00040000 (262144)
 */
DefinitionBlock ("", "SSDT", 2, "ACRSYS", "ACRPRDCT", 0x00001000)
{
    External (_PR_.AAC0, UnknownObj)    // (from opcode)
    External (_PR_.ACRT, UnknownObj)    // (from opcode)
    External (_PR_.APSV, UnknownObj)    // (from opcode)
    External (_PR_.CPU0, UnknownObj)    // (from opcode)
    External (_PR_.CPU1, UnknownObj)    // (from opcode)
    External (_PR_.CPU2, UnknownObj)    // (from opcode)
    External (_PR_.CPU3, UnknownObj)    // (from opcode)
    External (_PR_.CPU4, UnknownObj)    // (from opcode)
    External (_PR_.CPU5, UnknownObj)    // (from opcode)
    External (_PR_.CPU6, UnknownObj)    // (from opcode)
    External (_PR_.CPU7, UnknownObj)    // (from opcode)
    External (_PR_.DTS1, UnknownObj)    // (from opcode)
    External (_PR_.DTS2, UnknownObj)    // (from opcode)
    External (_PR_.DTS3, UnknownObj)    // (from opcode)
    External (_PR_.DTS4, UnknownObj)    // (from opcode)
    External (_PR_.DTSE, UnknownObj)    // (from opcode)
    External (_PR_.PDTS, UnknownObj)    // (from opcode)
    External (_PR_.PKGA, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.ECAV, IntObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.ECMT, MutexObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.PECH, FieldUnitObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.PECL, FieldUnitObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.PENV, FieldUnitObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.PLMX, FieldUnitObj)    // (from opcode)
    External (AC0F, IntObj)    // (from opcode)
    External (AC1F, IntObj)    // (from opcode)
    External (ACT1, IntObj)    // (from opcode)
    External (ACTT, IntObj)    // (from opcode)
    External (CRTT, IntObj)    // (from opcode)
    External (CTYP, IntObj)    // (from opcode)
    External (PSVT, IntObj)    // (from opcode)
    External (TC1V, IntObj)    // (from opcode)
    External (TC2V, IntObj)    // (from opcode)
    External (TCNT, IntObj)    // (from opcode)
    External (TSPV, IntObj)    // (from opcode)
    External (VFN0, IntObj)    // (from opcode)
    External (VFN1, IntObj)    // (from opcode)
    External (VFN2, IntObj)    // (from opcode)
    External (VFN3, IntObj)    // (from opcode)
    External (VFN4, IntObj)    // (from opcode)

    Scope (\_TZ)
    {
        Name (ETMD, One)
        Event (FCET)
        Name (FCRN, Zero)
        Mutex (FCMT, 0x00)
        Name (CVF0, Zero)
        Name (CVF1, Zero)
        Name (CVF2, Zero)
        Name (CVF3, Zero)
        Name (CVF4, Zero)
        Mutex (FMT0, 0x00)
        Mutex (FMT1, 0x00)
        Mutex (FMT2, 0x00)
        Mutex (FMT3, 0x00)
        Mutex (FMT4, 0x00)
        PowerResource (FN00, 0x00, 0x0000)
        {
            Method (_STA, 0, Serialized)  // _STA: Status
            {
                Store (Zero, Local1)
                Store (Acquire (FMT0, 0x03E8), Local0)
                If (LEqual (Local0, Zero))
                {
                    Store (CVF0, Local1)
                    Release (FMT0)
                }

                Return (Local1)
            }

            Method (_ON, 0, Serialized)  // _ON_: Power On
            {
                Store (Acquire (FMT0, 0x03E8), Local0)
                If (LEqual (Local0, Zero))
                {
                    Store (One, CVF0)
                    Release (FMT0)
                }

                FNCL ()
            }

            Method (_OFF, 0, Serialized)  // _OFF: Power Off
            {
                Store (Acquire (FMT0, 0x03E8), Local0)
                If (LEqual (Local0, Zero))
                {
                    Store (Zero, CVF0)
                    Release (FMT0)
                }

                FNCL ()
            }
        }

        Device (FAN0)
        {
            Name (_HID, EisaId ("PNP0C0B"))  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
            {
                FN00
            })
        }

        PowerResource (FN01, 0x00, 0x0000)
        {
            Method (_STA, 0, Serialized)  // _STA: Status
            {
                Store (Zero, Local1)
                Store (Acquire (FMT1, 0x03E8), Local0)
                If (LEqual (Local0, Zero))
                {
                    Store (CVF1, Local1)
                    Release (FMT1)
                }

                Return (Local1)
            }

            Method (_ON, 0, Serialized)  // _ON_: Power On
            {
                Store (Acquire (FMT1, 0x03E8), Local0)
                If (LEqual (Local0, Zero))
                {
                    Store (One, CVF1)
                    Release (FMT1)
                }

                FNCL ()
            }

            Method (_OFF, 0, Serialized)  // _OFF: Power Off
            {
                Store (Acquire (FMT1, 0x03E8), Local0)
                If (LEqual (Local0, Zero))
                {
                    Store (Zero, CVF1)
                    Release (FMT1)
                }

                FNCL ()
            }
        }

        Device (FAN1)
        {
            Name (_HID, EisaId ("PNP0C0B"))  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
            {
                FN01
            })
        }

        PowerResource (FN02, 0x00, 0x0000)
        {
            Method (_STA, 0, Serialized)  // _STA: Status
            {
                Store (Zero, Local1)
                Store (Acquire (FMT2, 0x03E8), Local0)
                If (LEqual (Local0, Zero))
                {
                    Store (CVF2, Local1)
                    Release (FMT2)
                }

                Return (Local1)
            }

            Method (_ON, 0, Serialized)  // _ON_: Power On
            {
                Store (Acquire (FMT2, 0x03E8), Local0)
                If (LEqual (Local0, Zero))
                {
                    Store (One, CVF2)
                    Release (FMT2)
                }

                FNCL ()
            }

            Method (_OFF, 0, Serialized)  // _OFF: Power Off
            {
                Store (Acquire (FMT2, 0x03E8), Local0)
                If (LEqual (Local0, Zero))
                {
                    Store (Zero, CVF2)
                    Release (FMT2)
                }

                FNCL ()
            }
        }

        Device (FAN2)
        {
            Name (_HID, EisaId ("PNP0C0B"))  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
            {
                FN02
            })
        }

        PowerResource (FN03, 0x00, 0x0000)
        {
            Method (_STA, 0, Serialized)  // _STA: Status
            {
                Store (Zero, Local1)
                Store (Acquire (FMT3, 0x03E8), Local0)
                If (LEqual (Local0, Zero))
                {
                    Store (CVF3, Local1)
                    Release (FMT3)
                }

                Return (Local1)
            }

            Method (_ON, 0, Serialized)  // _ON_: Power On
            {
                Store (Acquire (FMT3, 0x03E8), Local0)
                If (LEqual (Local0, Zero))
                {
                    Store (One, CVF3)
                    Release (FMT3)
                }

                FNCL ()
            }

            Method (_OFF, 0, Serialized)  // _OFF: Power Off
            {
                Store (Acquire (FMT3, 0x03E8), Local0)
                If (LEqual (Local0, Zero))
                {
                    Store (Zero, CVF3)
                    Release (FMT3)
                }

                FNCL ()
            }
        }

        Device (FAN3)
        {
            Name (_HID, EisaId ("PNP0C0B"))  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
            {
                FN03
            })
        }

        PowerResource (FN04, 0x00, 0x0000)
        {
            Method (_STA, 0, Serialized)  // _STA: Status
            {
                Store (Zero, Local1)
                Store (Acquire (FMT4, 0x03E8), Local0)
                If (LEqual (Local0, Zero))
                {
                    Store (CVF4, Local1)
                    Release (FMT4)
                }

                Return (Local1)
            }

            Method (_ON, 0, Serialized)  // _ON_: Power On
            {
                Store (Acquire (FMT4, 0x03E8), Local0)
                If (LEqual (Local0, Zero))
                {
                    Store (One, CVF4)
                    Release (FMT4)
                }

                FNCL ()
            }

            Method (_OFF, 0, Serialized)  // _OFF: Power Off
            {
                Store (Acquire (FMT4, 0x03E8), Local0)
                If (LEqual (Local0, Zero))
                {
                    Store (Zero, CVF4)
                    Release (FMT4)
                }

                FNCL ()
            }
        }

        Device (FAN4)
        {
            Name (_HID, EisaId ("PNP0C0B"))  // _HID: Hardware ID
            Name (_UID, 0x04)  // _UID: Unique ID
            Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
            {
                FN04
            })
        }

        Method (FNCL, 0, NotSerialized)
        {
            Store (Acquire (FCMT, 0x03E8), Local5)
            If (LEqual (Local5, Zero))
            {
                Store (FCRN, Local6)
                Release (FCMT)
            }

            If (LNotEqual (Local6, Zero))
            {
                Signal (FCET)
                Return (Zero)
            }
            Else
            {
                Store (Acquire (FCMT, 0x03E8), Local5)
                If (LEqual (Local5, Zero))
                {
                    Store (One, FCRN)
                    Release (FCMT)
                }

                Store (Zero, Local5)
                While (LLess (Local5, 0x04))
                {
                    If (LNotEqual (Wait (FCET, 0x05), Zero))
                    {
                        Store (0x04, Local5)
                    }
                    Else
                    {
                        Increment (Local5)
                    }
                }

                Store (Acquire (FCMT, 0x03E8), Local5)
                If (LEqual (Local5, Zero))
                {
                    Store (Zero, FCRN)
                    Release (FCMT)
                }
            }

            Store (Zero, Local0)
            Store (Zero, Local1)
            Store (Zero, Local2)
            Store (Zero, Local3)
            Store (Zero, Local4)
            Store (Acquire (FMT0, 0x03E8), Local5)
            If (LEqual (Local5, Zero))
            {
                Store (CVF0, Local0)
                Release (FMT0)
            }

            Store (Acquire (FMT1, 0x03E8), Local5)
            If (LEqual (Local5, Zero))
            {
                Store (CVF1, Local1)
                Release (FMT1)
            }

            Store (Acquire (FMT2, 0x03E8), Local5)
            If (LEqual (Local5, Zero))
            {
                Store (CVF2, Local2)
                Release (FMT2)
            }

            Store (Acquire (FMT3, 0x03E8), Local5)
            If (LEqual (Local5, Zero))
            {
                Store (CVF3, Local3)
                Release (FMT3)
            }

            Store (Acquire (FMT4, 0x03E8), Local5)
            If (LEqual (Local5, Zero))
            {
                Store (CVF4, Local4)
                Release (FMT4)
            }

            Store (Local0, \VFN0)
            Store (Local1, \VFN1)
            Store (Local2, \VFN2)
            Store (Local3, \VFN3)
            Store (Local4, \VFN4)
        }

        ThermalZone (TZ00)
        {
            Name (PTMP, 0x0BB8)
            Method (_SCP, 1, Serialized)  // _SCP: Set Cooling Policy
            {
                Store (Arg0, \CTYP)
            }

            Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
            {
                If (CondRefOf (\_PR.ACRT))
                {
                    If (LNotEqual (\_PR.ACRT, Zero))
                    {
                        Return (Add (0x0AAC, Multiply (\_PR.ACRT, 0x0A)))
                    }
                }

                Return (Add (0x0AAC, Multiply (\CRTT, 0x0A)))
            }

            Method (_AC0, 0, Serialized)  // _ACx: Active Cooling
            {
                If (CondRefOf (\_PR.AAC0))
                {
                    If (LNotEqual (\_PR.AAC0, Zero))
                    {
                        Return (Add (0x0AAC, Multiply (\_PR.AAC0, 0x0A)))
                    }
                }

                Return (Add (0x0AAC, Multiply (\ACTT, 0x0A)))
            }

            Method (_AC1, 0, Serialized)  // _ACx: Active Cooling
            {
                Return (Add (0x0AAC, Multiply (\ACT1, 0x0A)))
            }

            Method (_AC2, 0, Serialized)  // _ACx: Active Cooling
            {
                Return (Subtract (Add (0x0AAC, Multiply (\ACT1, 0x0A)), 0x32))
            }

            Method (_AC3, 0, Serialized)  // _ACx: Active Cooling
            {
                Return (Subtract (Add (0x0AAC, Multiply (\ACT1, 0x0A)), 0x64))
            }

            Method (_AC4, 0, Serialized)  // _ACx: Active Cooling
            {
                Return (Subtract (Add (0x0AAC, Multiply (\ACT1, 0x0A)), 0x96))
            }

            Name (_AL0, Package (0x01)  // _ALx: Active List
            {
                FAN0
            })
            Name (_AL1, Package (0x01)  // _ALx: Active List
            {
                FAN1
            })
            Name (_AL2, Package (0x01)  // _ALx: Active List
            {
                FAN2
            })
            Name (_AL3, Package (0x01)  // _ALx: Active List
            {
                FAN3
            })
            Name (_AL4, Package (0x01)  // _ALx: Active List
            {
                FAN4
            })
            Method (_TMP, 0, Serialized)  // _TMP: Temperature
            {
                If (LNot (ETMD))
                {
                    Return (0x0BB8)
                }

                If (CondRefOf (\_PR.DTSE))
                {
                    If (LEqual (\_PR.DTSE, 0x03))
                    {
                        Return (Add (0x0B10, Multiply (\CRTT, 0x0A)))
                    }
                }

                If (CondRefOf (\_PR.DTSE))
                {
                    If (LEqual (\_PR.DTSE, One))
                    {
                        If (LEqual (\_PR.PKGA, One))
                        {
                            Store (\_PR.PDTS, Local0)
                            Return (Add (0x0AAC, Multiply (Local0, 0x0A)))
                        }

                        Store (\_PR.DTS1, Local0)
                        If (LGreater (\_PR.DTS2, Local0))
                        {
                            Store (\_PR.DTS2, Local0)
                        }

                        If (LGreater (\_PR.DTS3, Local0))
                        {
                            Store (\_PR.DTS3, Local0)
                        }

                        If (LGreater (\_PR.DTS4, Local0))
                        {
                            Store (\_PR.DTS4, Local0)
                        }

                        Return (Add (0x0AAC, Multiply (Local0, 0x0A)))
                    }
                }

                Return (0x0BC2)
            }
        }

        ThermalZone (TZ01)
        {
            Name (PTMP, 0x0BB8)
            Method (_SCP, 1, Serialized)  // _SCP: Set Cooling Policy
            {
                Store (Arg0, \CTYP)
            }

            Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
            {
                If (CondRefOf (\_PR.ACRT))
                {
                    If (LNotEqual (\_PR.ACRT, Zero))
                    {
                        Return (Add (0x0AAC, Multiply (\_PR.ACRT, 0x0A)))
                    }
                }

                Return (Add (0x0AAC, Multiply (\CRTT, 0x0A)))
            }

            Method (_TMP, 0, Serialized)  // _TMP: Temperature
            {
                If (LNot (ETMD))
                {
                    Return (0x0BCC)
                }

                If (CondRefOf (\_PR.DTSE))
                {
                    If (LEqual (\_PR.DTSE, 0x03))
                    {
                        Return (Add (0x0B10, Multiply (\CRTT, 0x0A)))
                    }
                }

                If (CondRefOf (\_PR.DTSE))
                {
                    If (LEqual (\_PR.DTSE, One))
                    {
                        If (LEqual (\_PR.PKGA, One))
                        {
                            Store (\_PR.PDTS, Local0)
                            Return (Add (0x0AAC, Multiply (Local0, 0x0A)))
                        }

                        Store (\_PR.DTS1, Local0)
                        If (LGreater (\_PR.DTS2, Local0))
                        {
                            Store (\_PR.DTS2, Local0)
                        }

                        If (LGreater (\_PR.DTS3, Local0))
                        {
                            Store (\_PR.DTS3, Local0)
                        }

                        If (LGreater (\_PR.DTS4, Local0))
                        {
                            Store (\_PR.DTS4, Local0)
                        }

                        Return (Add (0x0AAC, Multiply (Local0, 0x0A)))
                    }
                }

                Return (0x0BD6)
            }

            Method (XPSL, 0, Serialized)
            {
                If (LEqual (\TCNT, 0x08))
                {
                    Return (Package (0x08)
                    {
                        \_PR.CPU0, 
                        \_PR.CPU1, 
                        \_PR.CPU2, 
                        \_PR.CPU3, 
                        \_PR.CPU4, 
                        \_PR.CPU5, 
                        \_PR.CPU6, 
                        \_PR.CPU7
                    })
                }

                If (LEqual (\TCNT, 0x04))
                {
                    Return (Package (0x04)
                    {
                        \_PR.CPU0, 
                        \_PR.CPU1, 
                        \_PR.CPU2, 
                        \_PR.CPU3
                    })
                }

                If (LEqual (\TCNT, 0x02))
                {
                    Return (Package (0x02)
                    {
                        \_PR.CPU0, 
                        \_PR.CPU1
                    })
                }

                Return (Package (0x01)
                {
                    \_PR.CPU0
                })
            }

            Method (XPSV, 0, Serialized)
            {
                If (CondRefOf (\_PR.APSV))
                {
                    If (LNotEqual (\_PR.APSV, Zero))
                    {
                        Return (Add (0x0AAC, Multiply (\_PR.APSV, 0x0A)))
                    }
                }

                Return (Add (0x0AAC, Multiply (\PSVT, 0x0A)))
            }

            Method (XTC1, 0, Serialized)
            {
                Return (\TC1V)
            }

            Method (XTC2, 0, Serialized)
            {
                Return (\TC2V)
            }

            Method (XTSP, 0, Serialized)
            {
                Return (\TSPV)
            }
        }
    }
}

