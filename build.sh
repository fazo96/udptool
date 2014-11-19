# UDPTOOL Build Script
# This script builds udptool's source code into a working node executable

echo '#!/usr/bin/env node' > bin/udptool
coffee -b -c --no-header -p src/udptool.coffee >> bin/udptool
chmod +x bin/udptool
