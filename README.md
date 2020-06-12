FractalAscii is a command line  ascii fractal generator written in haskell.

License
=======
FractalAscii is licensed under [Creative Commons Attribution Non-Commercial ShareAlike 3.0 Unported](http://creativecommons.org/licenses/by-nc-sa/3.0)
![Creative Commons Attribution Non-Commercial ShareAlike 3.0 Unported](http://i.creativecommons.org/l/by-nc-sa/3.0/80x15.png)

Installation
============
Pull from repo, and compile:
---------------------------
    git clone https://github.com/nihils/FractalAscii.git
    cd FractalAscii 
    make 

Operation
=========
Default Mandelbrot:
-------------------
    cd FractalAscii
    ./fractalascii

Multibrot
---------
You can specify type of fractal (-f), character (-c), max iterations (-m), and other options:
     
     ./fractalascii -f multibrot -c ~ -m 100 -d 4 -w 800 -h 600 

Options/Usage
-------------
    Usage: fractalascii [OPTIONS]
	-f STRING  --fractal=STRING  mandelbrot | multibrot | multibar | tricorn
	-c CHAR    --char=CHAR       What character you would like to use to paint the fractal
	-m INT     --max=INT         Maximum number of iterations
	-d INT     --degree=INT      Degree of polynomial for multibrot and multibar fractals
	-w INT     --width=INT       Width of resulting fractal
	-h INT     --height=INT      Height of resulting fractal
