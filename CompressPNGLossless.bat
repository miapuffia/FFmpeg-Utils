SETLOCAL
FOR /r "%CD%" %%a IN (*.png) DO (
	optipng -o2 -strip all "%%a"
)

pause