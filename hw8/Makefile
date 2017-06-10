# @author Aigerim Shintemirova, 1550398
# CSE 391 HW 8

# default target
default: use_ll_2.c linkedlist.o use_linkedlist.c linkedlist.o
	gcc -o list_demo use_ll_2.c linkedlist.o
	gcc -o list_test use_linkedlist.c linkedlist.o
	
# a target that builds an object file named linkedlist.o
target1: linkedlist.c linkedlist.h
	gcc -c linkedlist.c

# a target that builds an executable file named list_demo
target2: use_ll_2.c linkedlist.o
	gcc -o list_demo use_ll_2.c linkedlist.o

# a target that builds an executable file named list_test
target3: use_linkedlist.c linkedlist.o
	gcc -o list_test use_linkedlist.c linkedlist.o

# false target used to delete build files
clean:
	rm -rf *.o list_test.o list_demo.o


