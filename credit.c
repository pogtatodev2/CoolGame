#include <stdio.h>

int main() {
    int MonthlySalary = 5000;
    int Credit = 50000;
    int Years = 5;
    int Car = 20000;
    int Things = 10000;
    float Interest = 2.5;

    int FinalPrice = Credit / 100 * Interest + Credit;
    printf("%d\n", FinalPrice);

    return 0;
}