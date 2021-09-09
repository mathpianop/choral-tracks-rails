#!/usr/bin/env bash

SECRET=$(xxd -l 32 -c 32 -p < /dev/random)
echo "JWT_SECRET=${SECRET}" >> .env

