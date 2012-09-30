#
all: 
	cd src/ && ghc --make Main.hs -outputdir ../lib/ -o ../fractalascii && cd ../
