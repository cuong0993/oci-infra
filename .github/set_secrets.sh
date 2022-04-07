#!/bin/bash

set -e

cd ..
gh secret set PRIVATE_KEY_PEM <private_key.pem
