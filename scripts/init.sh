# leetcode show image in neovim editor
sudo dnf install -y ImageMagick-devel
sudo dnf install -y luarocks
sudo dnf install -y compat-lua-devel-5.1.5
luarocks --local --lua-version=5.1 install magick
