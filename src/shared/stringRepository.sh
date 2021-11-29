#!/bin/bash

containsIn() {
  [[ "$2" == *"$1"* ]] && echo 1 || echo 0
}
