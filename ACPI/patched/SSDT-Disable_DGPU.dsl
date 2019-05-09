/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-Disable_DGPU.aml, Fri May 10 01:02:34 2019
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000092 (146)
 *     Revision         0x02
 *     Checksum         0xFA
 *     OEM ID           "hack"
 *     OEM Table ID     "D-DGPU"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20160409 (538313737)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "D-DGPU", 0x00000000)
{
    External (_SB_.PCI0.RP01.PXSX._OFF, MethodObj)    // 0 Arguments (from opcode)

    Device (RMD1)
    {
        Name (_HID, "RMD10000")  // _HID: Hardware ID
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            If (CondRefOf (\_SB.PCI0.RP01.PXSX._OFF))
            {
                \_SB.PCI0.RP01.PXSX._OFF ()
            }
        }
    }
}

