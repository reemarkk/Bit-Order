#include <stdio.h>
 
long long int LittleToBigEndian(long long int number) {
// Converts a 64-bit integer from little-endian to big-endian format
    return 
        ((number & 0x00000000000000FF) << 56) |  
        ((number & 0xFF00000000000000) >> 56) |
        (((number & 0x000000000000FF00) << 40) |  
        ((number & 0x00FF000000000000) >> 40)) |
        (((number & 0x0000000000FF0000) << 24) |  
        ((number & 0x0000FF0000000000) >> 24))|
        (((number & 0x00000000FF000000) << 8) |  
        ((number & 0x000000FF00000000) >> 8)); 
}
 
void printHex(long long int number) {
    printf("0x%016llX\n", number);
}
 
int main() {
    long long int testNumber = 0x0102030405060708;  
    printf("Original : ");
    printHex(testNumber);
    
    long long int result = LittleToBigEndian(testNumber);
    printf("Converted : ");
    printHex(result);
    
    return 0;
}
