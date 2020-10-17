# Default target
all: package/sd_card.img

# Select the build type
TARGET=sw_emu

# Configure the project
PREFIX := aarch64-linux-gnu-
CXXFLAGS := -Wall -g -std=c++17 -D__XILINX__
HOST_SRC := ./src/main.cpp
## Accel APP
AAPP_SRC := ./src/vector_scale.cl
CONFIG   := zcu104.cfg

# Build recipe
app.exe: ${HOST_SRC}
	${PREFIX}g++ ${CXXFLAGS} ${HOST_SRC} -o app.exe \
		-I${SYSROOT}/usr/include/xrt \
		-L${SYSROOT}/usr/lib -lOpenCL -lpthread -lrt -lstdc++ --sysroot=${SYSROOT}

vector_scale.xo: ${AAPP_SRC}
	v++ -c -t ${TARGET} --config ${CONFIG} -k vector_scale -I./ ${AAPP_SRC} -o vector_scale.xo 

vector_scale.xclbin: ./vector_scale.xo
	v++ -l -t ${TARGET} --config ${CONFIG} ./vector_scale.xo -o vector_scale.xclbin

package/sd_card.img: app.exe emconfig.json vector_scale.xclbin xrt.ini run_app.sh
	v++ -p -t ${TARGET} --config ${CONFIG} ./vector_scale.xclbin \
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
	rm -rf vector_scale* app.exe *json *csv *log *summary _x package *.json .run .Xil .ipcache *.jou

# Unless specified, use the current directory name as the v++ build target
TARGET ?= $(notdir $(CURDIR))

