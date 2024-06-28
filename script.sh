#!/bin/bash

            for dir in k8s/*; do
              if [ -d "$dir" ]; then
                for file in "$dir"/*.yaml; do
                  echo "$file"
                done
              fi
            done