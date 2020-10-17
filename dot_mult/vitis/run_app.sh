
mount /dev/mmcblk0p1 /mnt
cd /mnt

cp platform_desc.txt /etc/xocl.txt

export XILINX_XRT=/usr
export XILINX_VITIS=/mnt
export XCL_EMULATION_MODE=sw_emu

./app.exe $1 

echo "INFO: press Ctrl+a x to exit qemu"
