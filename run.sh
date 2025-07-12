#!/bin/bash

set -e

echo "🌀 Updating submodules..."
git submodule update --init --recursive

echo "🐳 Building Docker containers..."
docker compose build

echo "🚀 Starting the stack..."
docker compose up
