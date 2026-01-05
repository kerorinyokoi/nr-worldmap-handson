sudo apt update
sudo apt install build-essential

mkdir recamera && cd recamera

wget https://github.com/Seeed-Studio/reCamera-OS/releases/download/0.2.1/sg2002_reCamera_0.2.1_emmc_sdk.tar.gz
tar -xzvf sg2002_reCamera_0.2.1_emmc_sdk.tar.gz

#Note: This tool is over 10GB in size. Please be aware of your disk space.
git clone https://github.com/sophgo/host-tools.git --depth=1
git clone https://github.com/Seeed-Studio/sscma-example-sg200x.git

export SG200X_SDK_PATH=$PWD/sg2002_recamera_emmc
export PATH=$PWD/host-tools/gcc/riscv64-linux-musl-x86_64/bin:$PATH

export SDK_INC="/workspaces/codespaces-blank/recamera/sg2002_recamera_emmc/install/soc_sg2002_recamera_emmc/tpu_musl_riscv64/cvitek_tpu_sdk/include"
export SDK_LIB="/workspaces/codespaces-blank/recamera/sg2002_recamera_emmc/buildroot-2021.05/output/cvitek_CV181X_musl_riscv64/host/riscv64-buildroot-linux-musl/sysroot/usr/lib"

riscv64-unknown-linux-musl-gcc -v
