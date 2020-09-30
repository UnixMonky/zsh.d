#!/bin/zsh

cd ${HOME}
for F in $(ls zsh.d/z*); do
  Z=$(basename $F)
  ln -fs zsh.d/${Z} .${Z}
done