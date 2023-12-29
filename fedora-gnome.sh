#!/bin/bash

cd ~

# necessary packages for install
sudo dnf install -y pip git curl

# install gnome extensions
pip install gnome-extensions-cli
gext install caffeine@patapon.info
gext install dash-to-dock@micxgx.gmail.com
gext install gtk4-ding@smedius.gitlab.com
gext install super-key@tommimon.github.com

# repos
sudo dnf config-manager --add-repo=https://negativo17.org/repos/fedora-spotify.repo
sudo dnf config-manager --add-repo https://repository.mullvad.net/rpm/stable/mullvad.repo

# packages
sudo dnf install -y ulauncher wmctrl # launcher
sudo dnf install -y micro btop neofetch nvtop # terminal utilities
sudo dnf install -y texlive-scheme-full texmaker #latex setup
sudo dnf install -y spotify-client # spotify client
sudo dnf install -y rust cargo # rust framework for spotify client
sudo dnf install -y steam mangohud goverlay # gaming
sudo dnf install -y qdirstat cpu-x gparted qbittorrent # utilities
sudo dnf install -y libreoffice # office program
sudo dnf install -y gimp inkscape # image programs
sudo dnf install -y vlc handbrake # video programs
sudo dnf install -y syncthing # file syncing program

# flatpak setup
sudo dnf install -y flatpak
sudo flatpak remote-delete fedora
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# flatpak packages
flatpak install -y org.gnome.Extensions ca.desrt.dconf-editor com.github.tchx84.Flatseal # gnome utils and flatpak permission program
flatpak install -y com.github.xournalpp.xournalpp # Journal app for wacom tablet
flatpak install -y dev.pulsar_edit.Pulsar io.github.shiftey.Desktop # Pulsar editor & github desktop
flatpak install -y org.freecadweb.FreeCAD # 3d drawing
flatpak install -y net.lutris.Lutris com.usebottles.bottles # lutris game management and wine emulation program
flatpak install -y com.brave.Browser # chromium based browser
flatpak install -y org.prismlauncher.PrismLauncher # minecraft launcher
flatpak install -y com.github.jeromerobert.pdfarranger # PDF arranging program
flatpak install -y com.slack.Slack us.zoom.Zoom # proprietary programs 
flatpak install -y org.bunkus.mkvtoolnix-gui com.github.huluti.Curtail # modify video files and image compression program

# python packages
pip install psutil pyusb # for switch payload use
pip install numpy scipy pandas pandoc # machine learning
pip install jupyterlab # jupyter framwork

# julia setup
curl -fsSL https://install.julialang.org | sh -s -- --yes
source ~/.bashrc

julia -e 'import Pkg;Pkg.add("IJulia")'
julia -e 'using IJulia; installkernel("Julia (16 threads)", env=Dict("JULIA_NUM_THREADS"=>"16"))'
julia -e 'using IJulia; installkernel("Julia (32 threads)", env=Dict("JULIA_NUM_THREADS"=>"32"))'

# julia packages
julia -e 'import Pkg;Pkg.add("Flux")' # Flux machine learning
julia -e 'import Pkg;Pkg.add("MIRT")' # jeff package
julia -e 'import Pkg;Pkg.add("Arpack")' # linear algebra partial subspace methods
julia -e 'import Pkg;Pkg.add("SparseArrays")' # sparse arrays
julia -e 'import Pkg;Pkg.add("Distances")' # build distance matrices with various metrics
julia -e 'import Pkg;Pkg.add("Distributions")' # probability package
julia -e 'import Pkg;Pkg.add("FlipPA")' # estimate rank of matrices
julia -e 'import Pkg;Pkg.add("HePPCAT")' # heteroscedastic pca
julia -e 'import Pkg;Pkg.add("Hungarian")' # hungarian algorithm for subspace clustering error
julia -e 'import Pkg;Pkg.add("JLD")' # save matrices and data in JLD files
julia -e 'import Pkg;Pkg.add("LaTeXStrings")' # latex in plots
julia -e 'import Pkg;Pkg.add("LinearMapsAA")' # jeff linear operators
julia -e 'import Pkg;Pkg.add("MAT")' # read matlab files
julia -e 'import Pkg;Pkg.add("MIRTjim")' # jeff plot images
julia -e 'import Pkg;Pkg.add("ThreadsX")' # multithread various julia operations
julia -e 'import Pkg;Pkg.add("TSVD")' # krylov partial svd method
julia -e 'import Pkg;Pkg.add("Plots")' # plots
julia -e 'import Pkg;Pkg.add("ProgressMeter")' # tqdm package in julia
julia -e 'import Pkg;Pkg.add("NearestNeighbors")' # kNN algorithm
julia -e 'import Pkg;Pkg.add("Optim")' # optimization cost functions
julia -e 'import Pkg;Pkg.add("ParallelKMeans")' # K means algorithm efficient method
julia -e 'import Pkg;Pkg.add("FFTW")' # fast fourier transforms
julia -e 'import Pkg;Pkg.add("BenchmarkTools")' # benchmark time

# spotify setup
git clone https://github.com/abba23/spotify-adblock.git
cd spotify-adblock
make
sudo make install
cd ~
LINE='export LD_PRELOAD=/usr/local/lib/spotify-adblock.so'
FILE='/usr/bin/spotify'
grep -qF -- "$LINE" "$FILE" || echo "$LINE" >> "$FILE"

# virtualization
sudo dnf group install --with-optional virtualization
sudo usermod -a -G libvirt $(whoami)
LINE='unix_sock_group = "libvirt"'
FILE='/etc/libvirt/libvirtd.conf'
grep -qF -- "$LINE" "$FILE" || echo "$LINE" >> "$FILE"
LINE='unix_sock_rw_perms = "0770"'
grep -qF -- "$LINE" "$FILE" || echo "$LINE" >> "$FILE"
sudo systemctl start libvirtd
sudo systemctl enable libvirtd

# bash mods + starship
curl -sS https://starship.rs/install.sh | sh -s -- --yes
LINE='neofetch --disable packages'
FILE='.bashrc'
grep -qF -- "$LINE" "$FILE" || echo "$LINE" >> "$FILE"
LINE='eval "$(starship init bash)"'
grep -qF -- "$LINE" "$FILE" || echo "$LINE" >> "$FILE"
cp linux/configs/starship.toml ~/.config/starship.toml


