MEMORY
{
    iram0_0_seg (RX) : org = 0x40080000, len = 0x20000
    dram0_0_seg (RW) : org = 0x3FFB0000, len = 0x18000
    drom0_0_seg (R)  : org = 0x3F400000, len = 0x100000
    iram0_2_seg (RX) : org = 0x400D0000, len = 0x40000
}

SECTIONS
{
    .text : {
        *(.text.startup)
        *(.text*)
    } > iram0_0_seg

    .data : {
        *(.data*)
    } > dram0_0_seg

    .bss : {
        *(.bss*)
    } > dram0_0_seg
}
