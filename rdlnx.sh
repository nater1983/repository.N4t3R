#!/bin/bash
echo "Updating my aarch64 scripts for rdlnx:"
find . -type f -name "*.SlackBuild" -exec sed -i '/cat \$CWD\/\$PRGNAM\.SlackBuild > \$PKG\/usr\/doc\/\$PRGNAM-\$VERSION\/\$PRGNAM\.SlackBuild/d' {} +
find . -type f -name "*.SlackBuild" -exec sed -i 's/BUILD=${BUILD:-[^}]*}/BUILD=${BUILD:-1}/g' {} +
find . -type f -name "*.SlackBuild" -exec sed -i 's|TMP=${TMP:-/tmp/SBo}|TMP=${TMP:-/tmp/rdlnx}|g' {} +
find . -type f -name "*.SlackBuild" -exec sed -i 's/TAG=${TAG:-[^}]*}/TAG=${TAG:-_rdlnx}/g' {} +
