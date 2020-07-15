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
     GPIOB->DDR |= 0x20;  // PB.5 sebagai output; 0x20 = 0010 0000
     GPIOB->CR1 |= 0x20;  // PB.5 Push Pull Type Output
     while (1)
     {
            GPIOB->ODR |=1<<5;  // PB.5 = 1             
            myDelay();                          
            GPIOB->ODR &= ~(1<<5); // PB.5 = 0
            myDelay();
     }
}
