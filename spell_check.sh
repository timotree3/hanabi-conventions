#!/bin/bash

# From: https://github.com/eleven-labs/blog.eleven-labs.com/blob/master/bin/check-spelling.sh

MARKDOWN_TEXT=`(find . -name '*.md' -exec cat {} \;)`
MISSPELLED=`echo $MARKDOWN_TEXT | aspell --lang=en --encoding=utf-8 list | sort -u`
# --personal=./.aspell.en.pws list
NUM_MISSPELLED=`echo "$MISSPELLED" | wc -l`
if [[ $NB_MISSPELLED -gt 0 ]]; then
  echo -e "Misspelled words:"
  MISSPELLED=`echo "$MISSPELLED" | sed -E ':a;N;$!ba;s/\n/, /g'`
  echo "$MISSPELLED"
  exit 1
fi
echo "No misspelled words."