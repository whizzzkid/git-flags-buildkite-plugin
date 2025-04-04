#!/usr/bin/env bats

setup() {
  load "$BATS_PLUGIN_PATH/load.bash"

  # Uncomment to enable stub debugging
  # export GIT_STUB_DEBUG=/dev/tty
}

# Uncomment the following line to debug stub failures
# export BUILDKITE_AGENT_STUB_DEBUG=/dev/tty

@test "Sets the clone flags" {
  export BUILDKITE_PLUGIN_GIT_FLAGS_CLONE="--all"

  run "$PWD/hooks/pre-checkout"

  assert_success
  assert_output --partial "Set buildkite git clone flags to $BUILDKITE_PLUGIN_GIT_FLAGS_CLONE"
}

@test "Sets the fetch flags" {
  export BUILDKITE_PLUGIN_GIT_FLAGS_FETCH="--all"

  run "$PWD/hooks/pre-checkout"

  assert_success
  assert_output --partial "Set buildkite git fetch flags to $BUILDKITE_PLUGIN_GIT_FLAGS_FETCH"
}
