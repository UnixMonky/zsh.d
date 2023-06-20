#!/bin/zsh

cd ${HOME}
for F in $(ls git/zsh.d/z*); do
  Z=$(basename $F)
  ln -fs zsh.d/${Z} .${Z}
done
