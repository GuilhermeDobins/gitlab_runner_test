FTP_HOST='oplab9.parqtec.unicamp.br'
LOCALPATH=$CI_PROJECT_DIR/restic/output
#REMOTEPATH='/ppc64el/restic'
ROOTPATH="~/rpmbuild/RPMS/ppc64le"
#REPO1="/repository/debian/ppc64el/restic"
#REPO2="/repository/rpm/ppc64le/restic"
github_version=$(cat github_version.txt)
ftp_version=$(cat ftp_version.txt)

if [ $github_version != '0' ]
then
  cd $LOCALPATH
  git clone https://$USERNAME:$TOKEN@github.com/Unicamp-OpenPower/repository-scrips.git
  cd repository-scrips/
  chmod +x empacotar-deb.sh
  chmod +x empacotar-rpm.sh
  sudo mv empacotar-deb.sh $LOCALPATH
  sudo mv empacotar-rpm.sh $LOCALPATH
  cd $LOCALPATH
  sudo ./empacotar-deb.sh restic restic-$github_version $github_version " "
  sudo ./empacotar-rpm.sh restic restic-$github_version $github_version " " "Fast, secure, efficient backup program."
  if [ $github_version > '0' ]
  then
    lftp -c "open -u $USER,$PASS ftp://oplab9.parqtec.unicamp.br; put -O /teste/guilherme $LOCALPATH/restic-$github_version"
    lftp -c "open -u $USER,$PASS ftp://oplab9.parqtec.unicamp.br; put -O /teste/guilherme $LOCALPATH/restic-$github_version-ppc64le.deb"
    sudo lftp -c "set ssl:verify-certificate false; open -u $USER,$PASS ftp://oplab9.parqtec.unicamp.br; put -O /teste/guilherme $ROOTPATH/restic-$github_version-1.ppc64le.rpm"
  fi
fi
