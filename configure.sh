#!/bin/sh
set -x

echo "Install Homebrew:"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo '#!/bin/sh' > /usr/local/bin/extMerge
echo '/Applications/p4merge.app/Contents/MacOS/p4merge $*' > /usr/local/bin/extMerge

echo '#!/bin/sh' > /usr/local/bin/extDiff
echo '[ $# -eq 7 ] && /usr/local/bin/extMerge "$2" "$5"' >> /usr/local/bin/extDiff

chmod +x /usr/local/bin/extMerge
chmod +x /usr/local/bin/extDiff
