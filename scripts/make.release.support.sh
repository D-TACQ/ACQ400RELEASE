
# source me. common support for make.release.*

# subdirectories on target
MNTDIRS="bin boot.d dtb.d fpga.d local packages packages.opt ko"


# list of .dtb names to include
# pull from acq400_kernel/arch/arm/boot/dts/Makefile
# :.,$s/ \\/
# :.,$s/^TAB//
# :.,$s///g

ARCHDTB="
acq2006.dtb
acq2006b.dtb
acq2006bEU.dtb
acq1001.dtb
acq1002.dtb
acq1002p.dtb
acq1002r.dtb
acq1002w.dtb
acq1014.dtb
acq1102.dtb
acq2106.dtb
acq2106sfp.dtb
acq210612.dtb
acq2106sfp2.dtb
acq2106d37.dtb
acq2106d37sfp.dtb
acq2206.dtb
acq2206sfp.dtb
acq2206d37.dtb
acq2206d37sfp.dtb
kmcu.dtb
kmcuz30.dtb
kmcuz30_bpe.dtb
z7io.dtb
z7io_cpld_overlay.dtb
z7io_rtmi2c_overlay.dtb
acq400_uart0.dtb
acq400_2D_overlay.dtb
acq400_usb_host_overlay.dtb
acq400_usb_otg_overlay.dtb
acq400_usb_peripheral_overlay.dtb
acq400dsp1_overlay.dtb
acq400dsp2_overlay.dtb
acq1102_sfp1_overlay.dtb
acq1102_sfp1_overlay.dtb
acq2106_1000X_overlay.dtb
acq2106_sc_overlay.dtb
acq2106_acq435elfx_sc_overlay.dtb
acq2106_quadcomms_overlay.dtb
acq2106_hudp_overlay.dtb
acq2x06_enable_mgtAB.dtb
acq2x06_di460_overlay.dtb
mgt482_sfp1_overlay.dtb
mgt482_sfp2_overlay.dtb
mgt482_sfp3_overlay.dtb
mgt482_sfp4_overlay.dtb
mgt48x_clk_overlay.dtb
mgt48x_clk_overlay_156M25.dtb
"

