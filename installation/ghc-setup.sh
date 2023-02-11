#!/bin/bash

ghcup install ghc recommended --set
ghcup install cabal recommended --set
ghcup install stack recommended --set
ghcup install hls recommended --set
cabal update
cabal new-configure --disable-library-vanilla --enable-shared --enable-executable-dynamic --ghc-options=-dynamic
