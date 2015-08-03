#include <stdio.h>
#include <time.h>
#include <stdlib.h>

struct tree_t {
	tree_t *right;
	hf *left;
	char value;
};

int main()
{
    unsigned int data[2048];
    unsigned int amt[16];
    // A 1 KB page worth of nibbles                   
    srand((unsigned int) time(NULL));

    // Skewed Random Generation
    for(int i = 0; i < 2048; i++) {
    	unsigned char num = ((unsigned char) 0xFF & rand());
    	printf("%d  ", num);
    	if (num < 80) {
    		data[i] = 0;
    		amt[0]++;
    	}
    	else if (num < 130) {
			data[i] = 1;
			amt[1]++;
    	}
    	else if (num < 150) {
			data[i] = 2;
			amt[2]++;
    	}
    	else if (num < 170) {
			data[i] = 3;
			amt[3]++;
    	}
    	else if (num < 185) {
			data[i] = 4;
			amt[4]++;
    	}
    	else if (num < 200) {
			data[i] = 5;
			amt[5]++;
    	}
    	else if (num < 210) {
			data[i] = 6;
			amt[6]++;
    	}
    	else if (num < 220) {
			data[i] = 7;
			amt[7]++;
    	}
    	else if (num < 225) {
			data[i] = 8;
			amt[8]++;
    	}
    	else if (num < 230) {
			data[i] = 9;
			amt[9]++;
    	}
    	else if (num < 235) {
			data[i] = 10;
			amt[10]++;
    	}
    	else if (num < 240) {
			data[i] = 11;
			amt[11]++;
    	}
    	else if (num < 245) {
			data[i] = 12;
			amt[12]++;
    	}
    	else if (num < 250) {
			data[i] = 13;
			amt[13]++;
    	}
    	else if (num < 255) {
			data[i] = 14;
			amt[14]++;
    	}
    	else if (num < 256) {
			data[i] = 15;
			amt[15]++;
    	}
    }

    printf( "\n0:%d\n", amt[0] );
    printf( "1:%d\n", amt[1] );
    printf( "2:%d\n", amt[2] );
    printf( "3:%d\n", amt[3] );
    printf( "4:%d\n", amt[4] );
    printf( "5:%d\n", amt[5] );
    printf( "6:%d\n", amt[6] );
    printf( "7:%d\n", amt[7] );
    printf( "8:%d\n", amt[8] );
    printf( "9:%d\n", amt[9] );
    printf( "10:%d\n", amt[10] );
    printf( "11:%d\n", amt[11] );
    printf( "12:%d\n", amt[12] );
    printf( "13:%d\n", amt[13] );
    printf( "14:%d\n", amt[14] );
    printf( "15:%d\n", amt[15] );



}