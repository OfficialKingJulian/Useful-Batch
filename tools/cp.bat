::@echo off
:: robocopy is long to type
set in=%1
set out=%2
shift
shift
robocopy "%in%" "%out%"
