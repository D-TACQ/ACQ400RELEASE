
# source me. common support for make.release.*

# subdirectories on target
MNTDIRS="bin boot.d dtb.d fpga.d local packages packages.opt ko z7io"


# list of .dtb names to include
# pull from acq400_kernel/arch/arm/boot/dts/Makefile
# :.,$s/ \\/
# :.,$s/^TAB//
# :.,$s/.dtb//g

ARCHDTB="
acq2006
acq2006b
acq2006bEU
acq1001
acq1002
acq1002p
acq1002r
acq1002w
acq1014
acq1102
acq2106
acq2106sfp
acq210612
acq2106sfp2
acq2106d37
acq2106d37sfp
acq2206
acq2206sfp
acq2206d37
acq2206d37sfp
kmcu
kmcuz30
kmcuz30_bpe
z7io
z7io_cpld_overlay
z7io_rtmi2c_overlay
z7io_mbox_overlay
z7io_rtm_elf1_geo_overlay
z7io_rtm_elf1_overlay
z7io_rtm_elf2_geo_overlay
z7io_rtm_elf2_overlay
acq400_uart0
acq400_2D_overlay
acq400_usb_host_overlay
acq400_usb_otg_overlay
acq400_usb_peripheral_overlay
acq400dsp1_overlay
acq400dsp2_overlay
acq1102_commsA_overlay
acq1102_commsB_overlay
acq1102_mmc1_overlay
acq1102_sfp1_overlay
acq1102_sfp2_overlay
acq2106_1000X_overlay
acq2106_sc_overlay
acq2106_acq435elfx_sc_overlay
acq2106_quadcomms_overlay
acq2106_hudp_overlay
acq2x06_enable_mgtAB
mgtC_overlay
acq2x06_di460_overlay
mgt482_sfp1_overlay
mgt482_sfp2_overlay
mgt482_sfp3_overlay
mgt482_sfp4_overlay
mgt48x_clk_overlay
mgt48x_clk_overlay_156M25
"

