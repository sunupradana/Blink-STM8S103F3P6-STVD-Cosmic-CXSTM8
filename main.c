#include "stm8s.h"


void myDelay(void);

void myDelay()
{
   int i,j;
   for(i=0;i<4000;i++)
   {
       for(j=0;j<100;j++);    
       }  
}   

main()   
{            
     GPIOB->DDR |= 0x20;  // PD.0 as Output
     GPIOB->CR1 |= 0x20;  // PD.0 as Push Pull Type Output
     while (1)
     {
            GPIOB->ODR |=1<<5;  // PD.o = 1             
            myDelay();                          
            GPIOB->ODR &= ~(1<<5); // PD.0 = 0
            myDelay();
     }
}
