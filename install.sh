#!/bin/zsh

FOLDER_NAME=.install

chmod a+x /Users/$USER/build-openttd-app/openttd.sh || exit 1
cd

INSTALL_PATH="/Users/$USER/build-openttd-app"
LIBRARY_PATH="/Users/$USER/Library/$FOLDER_NAME"
HOMEBREW_PATH="$LIBRARY_PATH/homebrew"

echo "export PATH=\"$HOMEBREW_PATH/bin:\$PATH\"" >> "/Users/$USER/.zshrc"
echo "alias openttd=\"$INSTALL_PATH/openttd.sh $FOLDER_NAME\"" >> "/Users/$USER/.zshrc"

source ~/.zshrc

mkdir -p "$LIBRARY_PATH"
cd "$LIBRARY_PATH" || exit 1

mkdir -p "$HOMEBREW_PATH"
cd "$HOMEBREW_PATH" || exit 1

curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C "$HOMEBREW_PATH" || exit 1
cd "$LIBRARY_PATH" || exit 1
rm -rf OpenTTD || exit 1

brew install ninja

cd homebrew/Cellar
git clone https://github.com/jharlan-hash/cmake
echo "alias cmake=/Users/$USER/Library/.install/homebrew/Cellar/cmake/bin/cmake" >> "/Users/$USER/.zshrc"
source ~/.zshrc

cd $LIBRARY_PATH

git clone https://github.com/jharlan-hash/OpenTTD || exit 1
cd OpenTTD || exit 1
mkdir build || exit 1
cd build || exit 1

cmake .. -DCMAKE_BUILD_TYPE=RelWithDebInfo -G "Ninja" || exit 1
ninja || exit 1
