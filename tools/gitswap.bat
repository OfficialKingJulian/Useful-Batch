@echo off 

:: A small but useful script 
:: to swap current git account

set instr=%1
shift

setlocal enabledelayedexpansion

if !instr!==personal (
  git config --global user.name  "kingjuliando"
  git config --global user.email sudo@kingjulian.xyz
    echo You are now using account kingjuliando
) else if !instr!==pro (
  git config --global user.name  "julianorchard"
  git config --global user.email contact@julians.email
    echo You are now using account JulianOrchard
) else (
  echo Accepts arguments of 'personal' or 'pro'
)

