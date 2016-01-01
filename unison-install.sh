#!/bin/sh

cd /tmp/unison || exit
for UNISON_TAR_GZ in `find *.tar.gz`
do
  cd /tmp/unison || exit
  tar -zxvf "$UNISON_TAR_GZ"
  UNISON_RELEASE=${UNISON_TAR_GZ%.tar.gz}
  cd "$UNISON_RELEASE" || exit
  make UISTYLE=text NATIVE=true
  cp unison /bin/"$UNISON_RELEASE"
  if [ -f unison-fsmonitor ]; then
    cp unison-fsmonitor /bin/"$UNISON_RELEASE-fsmonitor"
  fi
  if [ -f /bin/unison-"$UNISON_VERSION"-fsmonitor ]; then
  	ln -s -f /bin/unison-"$UNISON_VERSION"-fsmonitor /bin/unison-fsmonitor
  fi
done
