@echo off


for %%A in (%*) do (

	rmdir "%%A" /S /Q

)