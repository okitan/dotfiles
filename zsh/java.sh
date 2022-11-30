if [[ $(type java) = "java is /usr/bin/java" ]]; then
  export PATH="$(brew --prefix)/opt/openjdk/bin:$PATH"
fi
