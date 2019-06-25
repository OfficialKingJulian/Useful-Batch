@echo off

for %%A in (%*) do (
	
	if exist %%A (
	  @echo on 
		echo %%A already exists, could not create file
	  @echo off
	) else (
		copy NUL %%A >NUL
	  @echo on
		echo %%A successfully created
	  @echo off
	)
	
)
