bootstrap_setup_error_trap() {
  set -E

  local script_name=${1:-${BASH_SOURCE[1]##*/}}
  local error_prefix='[bootstrap]'
  if [[ -t 2 ]]; then
    error_prefix=$'\033[1;31m[bootstrap]\033[0m'
  fi

  # shellcheck disable=SC2329
  # Invoked indirectly via trap.
  bootstrap_on_error() {
    local exit_code=$?
    local line_no=${BASH_LINENO[0]}
    local command=$BASH_COMMAND

    printf '%s %s failed at line %s: %s\n' "$error_prefix" "$script_name" "$line_no" "$command" >&2
    exit "$exit_code"
  }

  trap bootstrap_on_error ERR
}