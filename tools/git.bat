@echo off 

:: A small but useful script 
:: to swap current git account

set insta=%1
set instr=%2
shift
shift

setlocal enabledelayedexpansion

if !insta!==swap (

  if !instr!==personal (
    git config --global user.name  "OfficialKingJulian"
    git config --global user.email official@kingjulian.xyz
      echo You are now using account OfficialKingJulian
  ) else if !instr!==pro (
    git config --global user.name  "julianorchard"
    git config --global user.email contact@julians.email
      echo You are now using account JulianOrchard
  ) else (
    echo Accepts arguments of 'personal' or 'pro'
  )
) else (
  git %*
)
