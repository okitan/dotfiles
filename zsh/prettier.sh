set_prettier() {
  if [[ ! -s .prettierrc.yml ]]; then
    (
      set -x
      cat <<__EOF__ | tee -a .prettierrc.yml
printWidth: 120
__EOF__
    )
  fi
  if [[ ! -s .prettierignore ]]; then
    (
      set -x
      cat <<__EOF__ | tee -a .prettierignore
tsconfig.json
__EOF__
    )
  fi
}
