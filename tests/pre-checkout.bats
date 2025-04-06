#!/usr/bin/env bats

setup() {
  load "$BATS_PLUGIN_PATH/load.bash"

  # Uncomment to enable stub debugging
  # export GIT_STUB_DEBUG=/dev/tty
}

# Uncomment the following line to debug stub failures
# export BUILDKITE_AGENT_STUB_DEBUG=/dev/tty


@test "Sets the clean flags" {
  export BUILDKITE_PLUGIN_GIT_FLAGS_CLEAN_FLAGS="foo"

  run "$PWD/hooks/pre-checkout"

  assert_success
  assert_output --partial "Set buildkite git clean flags to $BUILDKITE_PLUGIN_GIT_FLAGS_CLEAN_FLAGS"
}

@test "Sets the clone flags" {
  export BUILDKITE_PLUGIN_GIT_FLAGS_CLONE_FLAGS="--all"

  run "$PWD/hooks/pre-checkout"

  assert_success
  assert_output --partial "Set buildkite git clone flags to $BUILDKITE_PLUGIN_GIT_FLAGS_CLONE_FLAGS"
}

@test "Sets the clone mirror flags" {
  export BUILDKITE_PLUGIN_GIT_FLAGS_CLONE_MIRROR_FLAGS="foo"

  run "$PWD/hooks/pre-checkout"

  assert_success
  assert_output --partial "Set buildkite git clone mirror flags to $BUILDKITE_PLUGIN_GIT_FLAGS_CLONE_MIRROR_FLAGS"
}

@test "Sets the fetch flags" {
  export BUILDKITE_PLUGIN_GIT_FLAGS_FETCH_FLAGS="--all"

  run "$PWD/hooks/pre-checkout"

  assert_success
  assert_output --partial "Set buildkite git fetch flags to $BUILDKITE_PLUGIN_GIT_FLAGS_FETCH_FLAGS"
}

@test "Sets the mirrors lock timeout" {
  export BUILDKITE_PLUGIN_GIT_FLAGS_MIRRORS_LOCK_TIMEOUT="100"

  run "$PWD/hooks/pre-checkout"

  assert_success
  assert_output --partial "Set buildkite git mirrors lock timeout to $BUILDKITE_PLUGIN_GIT_FLAGS_MIRRORS_LOCK_TIMEOUT"
}

@test "Sets the mirrors paths" {
  export BUILDKITE_PLUGIN_GIT_FLAGS_MIRRORS_PATH="foo"

  run "$PWD/hooks/pre-checkout"

  assert_success
  assert_output --partial "Set buildkite git mirrors path to $BUILDKITE_PLUGIN_GIT_FLAGS_MIRRORS_PATH"
}

@test "Sets the mirrors skip update" {
  export BUILDKITE_PLUGIN_GIT_FLAGS_MIRRORS_SKIP_UPDATE="false"

  run "$PWD/hooks/pre-checkout"

  assert_success
  assert_output --partial "Set buildkite git mirrors skip update to $BUILDKITE_PLUGIN_GIT_FLAGS_MIRRORS_SKIP_UPDATE"
}
