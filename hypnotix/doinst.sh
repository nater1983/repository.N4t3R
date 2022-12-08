if [ -x /usr/bin/glib-compile-schemas ]; then
  /usr/bin/glib-compile-schemas /usr/share/glib-2.0/schemas >/dev/null 2>&1 &
fi
if [ -x /usr/bin/update-desktop-database ]; then
  /usr/bin/update-desktop-database -q usr/share/applications >/dev/null 2>&1
fi

( cd usr/share/hypnotix/pictures/badges ; rm -rf irak.svg )
( cd usr/share/hypnotix/pictures/badges ; ln -sf iraq.svg irak.svg )
