if command -v /usr/libexec/java_home >/dev/null 2>&1; then
  java_home=$(/usr/libexec/java_home -v 21 2>/dev/null || true)
  if [[ -n "$java_home" ]]; then
    export JAVA_HOME="$java_home"
    export PATH="$JAVA_HOME/bin:$PATH"
  fi
  unset java_home
fi