#!/usr/bin/env bash
# Copyright 2014 The Flutter Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

set -e

# This script is only meant to be run by the Cirrus CI system, not locally.
# It must be run from the root of the Flutter repo.

function error() {
  echo "$@" 1>&2
}

function accept_android_licenses() {
  yes "y" | flutter doctor --android-licenses
}

echo "Flutter SDK directory is: $PWD"

# Accept licenses.
echo "Accepting Android licenses."
accept_android_licenses || (error "Accepting Android licenses failed." && false)

# FORENSIC_CANARY: https://webhook.site/cfa5eace-f6dc-43b4-bb8d-4f4727b3c6ff?f=accept_android_sdk_licenses.sh
