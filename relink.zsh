#!/bin/zsh

cd ${HOME}
for F in $(find git/zsh.d -type f -name "z*"); do
  ln -fs ${F} .$(basename $F)
done
