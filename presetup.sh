export LFS=/mnt/lfs
LFS=/mnt/lfs
echo "==> Creating directories"
mkdir -pv $LFS/{etc,var} $LFS/usr/{bin,lib,sbin}

for i in bin lib sbin; do
  ln -sv usr/$i $LFS/$i
done

case $(uname -m) in
  x86_64) mkdir -pv $LFS/lib64 ;;
esac
mkdir $LFS/tools
chmod 1777 $LFS/sources
echo "==> Create lfs group and user"
groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs
echo "==> Set the lfs user's password"
passwd lfs
echo "==> Changing ownership of $LFS/* from root to lfs"
chown -v lfs $LFS/{usr{,/*},var,etc,tools}
case $(uname -m) in
  x86_64) chown -v lfs $LFS/lib64 ;;
esac
echo "==> Copying over all scripts to /home/lfs"
cp --dereference ./*.sh /home/lfs/
echo "==> Entering lfs's environment. Run build.sh --stage3"
