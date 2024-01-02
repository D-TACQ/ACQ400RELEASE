
# source me. common support for make.release.*

# subdirectories on target
MNTDIRS="bin boot.d dtb.d fpga.d local packages packages.opt ko"


# list of .dtb names to include
ARCHDTB="\
acq1001 acq1002 acq1002p acq1002r acq1002w acq400_uart0
acq2006 acq2006b acq2006bEU
acq2106d37 acq2106 acq2106sfp acq2106d37sfp acq210612
acq1014
acq1102
kmcu kmcuz30 kmcuz30_bpe
acq2206
acq2206sfp
acq2106_quadcomms_overlay
acq2106_hudp_overlay
acq2106_1000X_overlay
acq2106_sc_overlay
acq400_usb_host_overlay
acq400_usb_otg_overlay
acq400_usb_peripheral_overlay
acq2106_acq435elfx_sc_overlay
acq400dsp1_overlay acq400dsp2_overlay
z7io z7io_cpld_overlay z7io_rtmi2c_overlay
mgt482_sfp1_overlay
mgt482_sfp2_overlay
mgt482_sfp3_overlay
mgt482_sfp4_overlay
acq2x06_enable_mgtAB
mgt48x_clk_overlay
mgt48x_clk_overlay_156M25
acq2x06_di460_overlay"
