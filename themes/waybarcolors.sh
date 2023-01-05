#!/usr/bin/env bash


xrdb_grep() {
  grep "^\*\.$1:" ~/.Xresources  | cut -d':' -f2- | sed s/" "//
}

printf '@define-color wsactivebg %s;\n' "$(xrdb_grep 'selbgcolor')"
printf '@define-color textfg %s;\n' "$(xrdb_grep 'normfgcolor')"
