#!/bin/sh
# The compatibility entry for the Herdr plugin marketplace. The program lives at
# arhen/devnull-tui now; install it once, then run the copy that is on disk.
set -e

cd "$(dirname "$0")"

node="$(/bin/sh ./find-node.sh)" || {
  printf 'devnull: could not find node 20 or newer.\n' >&2
  printf 'Set DEVNULL_NODE=/path/to/node and reopen the pane.\n' >&2
  exit 1
}

ref="${DEVNULL_REF:-main}"
code="${DEVNULL_HOME:-$HOME/.local/share/devnull}"

if [ ! -f "$code/index.js" ]; then
  command -v curl >/dev/null 2>&1 || {
    printf 'devnull: curl is needed to install the terminal UI.\n' >&2
    exit 1
  }
  printf 'devnull: installing the terminal UI from arhen/devnull-tui…\n' >&2
  if ! curl -fsSL "https://raw.githubusercontent.com/arhen/devnull-tui/$ref/install.sh" | sh; then
    printf 'devnull: that failed. Run it by hand, then reopen the pane:\n' >&2
    printf '  curl -fsSL https://raw.githubusercontent.com/arhen/devnull-tui/main/install.sh | sh\n' >&2
    exit 1
  fi
fi

exec "$node" "$code/index.js" "$@"
