#!/bin/sh

sensors | awk '/^k10temp/ {getline; getline; print $2}'
