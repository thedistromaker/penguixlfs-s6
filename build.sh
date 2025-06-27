case $1 in
  --stage1)
    echo "=> Starting ./deps.sh"
    exec bash deps.sh
    ;;
  --stage2)
    echo "=> Starting ./presetup.sh"
    exec bash presetup.sh
    ;;
  --stage3)
    echo "=> Staring postlogin.sh"
    exec bash postlogin.sh
    ;;
  --stage4)
    echo "=> Starting toolchain.sh"
    exec bash toolchain.sh
    ;;
  --stage5)
    echo "=> Starting temptools.sh"
    exec bash temptools.sh
    ;;
  --stage6)
    echo "=> Starting chroot.sh"
    exec bash chroot.sh
    ;;
  --stage7)
    echo "=> Starting finalsystem.sh"
    exec bash finalsystem.sh
    ;;
  --stage8)
    echo "=> Starting makeboot.sh"
    exec bash makeboot.sh
    ;;
  --final)
    echo "=> Starting configall.sh"
    exec bash configall.sh
    ;;
  --auto)
    echo "=> Automatically checking stage"
    STAGE=$(cat $(pwd)/stage)
    case $STAGE in
      1)
        
