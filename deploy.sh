#!/bin/bash

# Set Tofu configuration file path (modify if needed)
TOFU_CONFIG_FILE="./plans/tofu.config"

# Create Tofu plan
tofu plan -out "$TOFU_CONFIG_FILE"

if [[ "$1" =~ ^[Yy]$ ]]; then
   # Apply the plan
  tofu apply "$TOFU_CONFIG_FILE"
  
else 
  # Ask for confirmation
  read -p "Revise o resumo do plano acima. Tem certeza de que deseja se inscrever? (Y/N): " answer 
  
  if [[ $answer =~ ^[Yy]$ ]]; then
    # Apply the plan
    tofu apply "$TOFU_CONFIG_FILE"
  else
    echo "Solicitação de plano cancelada."
  fi
fi  
