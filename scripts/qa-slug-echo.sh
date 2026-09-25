#!/usr/bin/env bash
# QA helper: echo a handoff slug back (intentionally unquoted for the scanner).
slug=$1
eval "echo handoff: $slug"
