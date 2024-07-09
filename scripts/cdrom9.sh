#挂在iso：
mkdir /mnt/cdrom
mount -o loop /path/to/your/centos.iso /mnt/cdrom

#创建仓库配置：/etc/yum.repos.d/local.repo
[local-AppStream]
name=CentOS 9 - AppStream
baseurl=file:///mnt/cdrom/AppStream
enabled=1
gpgcheck=0
[local-BaseOS]
name=CentOS 9 - BaseOS
baseurl=file:///mnt/cdrom/BaseOS
enabled=1
gpgcheck=0

#清除缓存
yum clean all
yum makecache

#/etc/dnf/dnf.conf
#installonly_limit=3

#使用本地源
dnf install --nogpgcheck --repoid="AppStream"
dnf install --nogpgcheck --repoid="BaseOS"
