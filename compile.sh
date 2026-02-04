set -euo pipefail

version="0.1.0"

if [ -d out ]; then
  rm -rf out
fi

if [ -f plainsyntax-$version.vsix ]; then
  rm plainsyntax-$version.vsix
fi

npm install -D typescript
npx tsc
npx vsce package --allow-missing-repository 

code --uninstall-extension plainsyntax-$version.vsix || true
cursor --uninstall-extension plainsyntax-$version.vsix || true

code --install-extension plainsyntax-$version.vsix
cursor --install-extension plainsyntax-$version.vsix