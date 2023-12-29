# This is inspired by (and a simpler version of) https://blog.jez.io/fzf-bazel

_fzf_complete_bazel_test() {
  _fzf_complete '-m' "$@" < <(command bazel query \
    "kind('(test|test_suite) rule', //...)" 2> /dev/null)
}

_fzf_complete_bazel() {
  local tokens
  tokens=(${(z)LBUFFER})

  if [ ${#tokens[@]} -ge 3 ] && [ "${tokens[2]}" = "test" ]; then
    _fzf_complete_bazel_test "$@"
  else
    _fzf_complete '-m' "$@" < <(command bazel query --keep_going \
      --noshow_progress \
      "//..." 2> /dev/null)
  fi
}
