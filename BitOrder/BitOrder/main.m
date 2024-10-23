#include <stdio.h>

void change(long long int *number){
    char temp1 , temp2;         //to store bits for swaping
    long long int base = 1;
    int right = 0;              //index for accessing bits
    
    while(right <= 32){
        int left = 63 - right;
        temp1 = (*number >> right) & 1;     //store the right bit
        temp2 = (*number >> left) & 1;    //store the second bit
        if( temp1 != temp2){
            *number ^= base << right;     //swap with XOR
            *number ^= base << left;
        }
        right++;
    }
}

void printBinary(long long int number) {
   for (int i = 63; i >= 0; i--) {
        char bit = (number >> i) & 1;
        printf("%d", bit);
    }
    printf("\n");
}

int main(int argc, const char * argv[]) {
       long long int number = 21;
       printf("Original number: %lld\n", number);
       printf("Original binary: ");
       printBinary(number);
       
       change(&number);
       
       printf("Modified binary: ");
       printBinary(number);
       printf("Modified number: %lld\n", number);
       
       return 0;
    //printf("%zu", sizeof(long long int));

}
