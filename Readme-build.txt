中文
1. Kernel 编译 
  - 安装内核压缩工具
    a) apt-get install lzop

  - 在Android的目录中使用以下命令解压
        tar xvzf LGF180_G_Kitkat_v30a_kernel.tar.gz
      
  - 编译内核源代码，你必须添加谷歌的工具链(toolchain) 进入Android的目录.

  - geeb运行以下的脚本来构建内核 
    a) cd kernel
    b) ./build-j1a.sh

  - geehrc运行以下的脚本来构建内核 
    a) cd kernel
    b) ./build-j1kt.sh

  - 建立之后，就可以找到生成的zip文件。 在Packages/**-kernel-dev-××-××-××××.zip

  - 拷贝到手机SD卡进行刷机，替换当前内核。


English
1. Kernel Build 
  - Installing the kernel compression tools
    a) apt-get install lzop

  - Uncompress using following command at the android directory
        tar xvzf LGF180_G_Kitkat_V30a_kernel.tar.gz 
       
  - When you compile the kernel source code, you have to add google original prebuilt source(toolchain) into the android directory.

  - geeb Run following scripts to build kernel
    a) cd kernel
    b) ./build-j1a.sh

  - geehrc Run following scripts to build kernel
    a) cd kernel
    b) ./build-j1kt.sh
  
  - After the establishment, you can find the generated zip file. In Packages/**-kernel-dev-××-××-××××.zip

  - Copy to the phone SD card brush machine, replace the current kernel.
   
