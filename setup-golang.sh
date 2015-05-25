#!/bin/bash
#
# Install golang for linux host.

function err {
    echo
    echo "$@" >&2
    exit 1
}

trap "err 'Error happened, failed to setup golang'" ERR

if [[ `uname` != 'Linux' ]]; then
  err "This script only works for linux"
fi

hash go >/dev/null 2>&1 && \
  err "go already installed, to reinstall, remove /usr/local/bin first"

if [[ ! -w /usr/local ]] ; then
  err "cannot write to /usr/local, check your permission plz."
fi

package_name="go1.4.2.linux-386.tar.gz"
if [[ $(arch) == x86_64 ]]; then
  package_name="go1.4.2.linux-amd64.tar.gz"
fi
download_url="https://storage.googleapis.com/golang/${package_name}"
echo "## downloading ${download_url}"

wget -P /tmp ${download_url}

# extract the package
echo "## extracting binaries to /usr/local/go"
tar -C /usr/local -xzf /tmp/${package_name}

mkdir -p $HOME/gocode

# setup environment setting
sh_profile="${HOME}/.bashrc"
if [[ "${SHELL}" == "/bin/zsh" ]]; then
  sh_profile="${HOME}/.zshenv"
fi

echo "## adding GOPATH to ${sh_profile}"
touch ${sh_profile}
if [[ -n "${SUDO_USER}" ]]; then
  chown ${SUDO_USER}:${SUDO_USER} ${sh_profile}
  chown ${SUDO_USER}:${SUDO_USER} $HOME/gocode
fi
gopath_cfg='export GOPATH=$HOME/gocode'
grep -q "^export GOPATH" ${sh_profile} && \
  sed -i "s|^export GOPATH.*|${gopath_cfg}|" ${sh_profile} || \
  echo "${gopath_cfg}" >> ${sh_profile}

echo "## adding gopath/bin to PATH"
gopathbin='export PATH=$PATH:${GOPATH//://bin:}/bin'
grep -q "${gopathbin}" ${sh_profile} ||
  echo "${gopathbin}" >> ${sh_profile}

echo "## adding go bin folder to PATH"
goinpath='export PATH=$PATH:/usr/local/go/bin'
grep -q "${goinpath}" ${sh_profile} ||
  echo "${goinpath}" >> ${sh_profile}

echo "## done. Enjoy golang!"
