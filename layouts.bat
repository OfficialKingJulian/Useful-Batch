@echo off

REM bad; not worth effort (at the moment) to fix

for %%A in (%*) do (
	if %%A == -help (
	  @echo on
	    echo.
		echo layouts command help;
		echo.
		echo   -brochures 
		echo                generates folders for brochure design
		echo.
		echo   -months 
		echo                generates folders for months
	  @echo off
	) else if %%A == -brochures (
		mkdir "1. Archive"
		mkdir "2. InDesign"
		mkdir "3. Low Quality"
		mkdir "4. High Quality"
		mkdir "5. Print Ready"
	) else if %%A == -months (
		mkdir "01. Jan"
		mkdir "02. Feb"
		mkdir "03. Mar"
		mkdir "04. Apr"
		mkdir "05. May"
		mkdir "06. Jun"
		mkdir "07. Jul"
		mkdir "08. Aug"
		mkdir "09. Sep"
		mkdir "10. Oct"
		mkdir "11. Nov"
		mkdir "12. Dec"
	) else (
	  @echo on
		echo %%A error, unrecognised parameter
	  @echo off
	)
	
)
