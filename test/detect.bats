#!/usr/bin/env bats

@test "detect recognizes the PACKAGIST_TOKEN variable" {
  export PACKAGIST_TOKEN=something
  run ./bin/detect
  [ $status -eq 0 ]
  [ "$output" = "PHP with Private Packagist" ]
}

@test "detect fails when missing the PACKAGIST_TOKEN variable" {
  run ./bin/detect
  [ $status -eq 1 ]
}
