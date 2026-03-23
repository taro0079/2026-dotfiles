set -euxo pipefail -o posix
today=$(date +'%Y%m%d')
cd neovim
git fetch -a
git checkout master
git merge origin/master
git clean -fdx
cd ..

rm -rf "neovim-${today}"
cp -r neovim "neovim-${today}"

cd "neovim-${today}"
make CMAKE_BUILD_TYPE=Release
sudo make install

