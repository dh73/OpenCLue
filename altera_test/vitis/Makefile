all: package/sd_card.img

TARGET=sw_emu

app.exe: host.cpp
	aarch64-linux-gnu-g++ -Wall -g -std=c++11 host.cpp -o app.exe \
		-I${SYSROOT}/usr/include/xrt \
		-L${SYSROOT}/usr/lib -lOpenCL -lpthread -lrt -lstdc++ --sysroot=${SYSROOT}

vector_add.xo: hello_world.cl
	v++ -c -t ${TARGET} --config zcu104.cfg -k vector_add -I./ hello_world.cl -o vector_add.xo 

vector_add.xclbin: ./vector_add.xo
	v++ -l -t ${TARGET} --config zcu104.cfg ./vector_add.xo -o vector_add.xclbin

package/sd_card.img: app.exe emconfig.json vector_add.xclbin xrt.ini run_app.sh
	v++ -p -t ${TARGET} --config zcu104.cfg ./vector_add.xclbin \
		--package.out_dir package \
		--package.rootfs ${ROOTFS}/rootfs.ext4 \
		--package.sd_file ${ROOTFS}/Image \
		--package.sd_file xrt.ini \
		--package.sd_file emconfig.json \
		--package.sd_file app.exe \
		--package.sd_file run_app.sh

emconfig.json:
	emconfigutil --platform xilinx_zcu104_base_202010_1 --nd 1

clean:
	rm -rf vector_add* app.exe *json *csv *log *summary _x package *.json .run .Xil .ipcache *.jou

# Unless specified, use the current directory name as the v++ build target
TARGET ?= $(notdir $(CURDIR))

