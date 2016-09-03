#!/bin/bash
#--------------------------------------------------
# scripts/shell/shared.sh
#
# Common shared functions used
# within the various scripts.
#--------------------------------------------------

  die()
  {
    echo $@ 1>&2
    exit 1
  }

  assert()
  {
    if "$@"; then
      :
    else
      die "assertion failed: " "$@"
    fi
  }

  #
  # print_help()
  #   Outputs the help usage message in
  #   the header comment of the script being
  #   run, wrapped by #<doc> ... #<enddoc>.
  #
  print_help()
  {
    cat "$0" | sed -n '/#<doc>/,/#<enddoc>/p' | while read -r line; do
      if [[ "$line" != '#'* ]]; then
        break
      elif [[ "$line" == '#!/bin/bash' || "$line" == '#<doc>' || "$line" == '#<enddoc>' ]]; then
        continue
      else
        echo "${line:2}"
      fi
    done
  }
