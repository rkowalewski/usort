# This is required in the paper itself
# if this is not defined then we use simple samplesort
# see src/main.cpp and the paper for details
#DEFS=-DKWICK -DKWAY=128

binUtils.o: src/binUtils.cpp include/binUtils.h
	mpicxx -I./include -std=c++11 -fopenmp -c src/binUtils.cpp

parUtils.o: src/parUtils.cpp include/parUtils.h
	mpicxx -I./include -std=c++11 -fopenmp -c src/parUtils.cpp

sort_profiler.o: src/sort_profiler.cpp include/sort_profiler.h
	mpicxx -I./include -std=c++11 -c src/sort_profiler.cpp

main.x:	parUtils.o binUtils.o src/main.cpp
	mpicxx -I./include -std=c++11 $(CFLAGS) -fopenmp src/main.cpp binUtils.o parUtils.o -o main.x

clean:
	rm -f *.o
	rm -f main.x
