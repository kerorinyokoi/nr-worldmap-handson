mkdir recamera
cd recamera
wget -q https://github.com/Seeed-Studio/reCamera-OS/releases/download/0.2.1/sg2002_reCamera_0.2.1_emmc_sdk.tar.gz
tar -xzvf sg2002_reCamera_0.2.1_emmc_sdk.tar.gz > /dev/null
git clone -q https://github.com/sophgo/host-tools.git --depth=1
git clone -q https://github.com/Seeed-Studio/sscma-example-sg200x.git
export SG200X_SDK_PATH=$PWD/sg2002_recamera_emmc
export PATH=$PWD/host-tools/gcc/riscv64-linux-musl-x86_64/bin:$PATH
export SDK_INC=$PWD/sg2002_recamera_emmc/install/soc_sg2002_recamera_emmc/tpu_musl_riscv64/cvitek_tpu_sdk/include
export SDK_LIB=$PWD/sg2002_recamera_emmc/buildroot-2021.05/output/cvitek_CV181X_musl_riscv64/host/riscv64-buildroot-linux-musl/sysroot/usr/lib
riscv64-unknown-linux-musl-gcc -v

wget -q https://www.kernel.org/pub/software/scm/git/git-2.52.0.tar.gz
tar zxvf git-2.52.0.tar.gz > /dev/null
cd git-2.52.0
make CC=riscv64-unknown-linux-musl-gcc AR=riscv64-unknown-linux-musl-ar CFLAGS="-I$SDK_INC" LDFLAGS="-L$SDK_LIB" PREFIX=/usr/local/git NO_TCLTK=YesPlease NO_GETTEXT=YesPlease NO_CURL=YesPlease NO_EXPAT=YesPlease NO_OPENSSL=YesPlease NO_ICONV=YesPlease NO_REGEX=NeedsStartEnd BLK_SHA1=YesPlease -j$(nproc)
file git
ls
pwd
