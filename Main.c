/****************************************************************************
*       Copyright (C), 北京四维拓智教育科技有限公司
*
*       MS80F080
*       V0.1
*       2017-12-04
*       Woody  QQ:2490006131
*Description  :MS83F0802BS
*           		   _________
* 				   VDD|1   M   8|VSS
*	 PA6/OSC2/CLKO/T1G|2   S   7|PA0/AN0/C1IN+/ICSPCLK
*         PC3/P1C/PWM4|3   8   6|PA1/AN1/C1IN-/ICSPDAT
*     PC2/AN6/P1D/PWM5|4___3___5|PC1/AN5/C2IN-/P1E/INT
*
*
*****************************************************************************/
#include "MyInclude.h"
#include "Tm1617.h"
#include "MyKey.h"
#include "stdio.h"
#include "string.h"
#include "stdlib.h"

/*  Variate ////////////////////////////////////////////////////////////////*/
u16 value;
u16 lastValue = 0;
char buffer[8];
// 主函数
void main(void)
{
    CLRWDT();//清看门狗
    System_init();
    GPIO_Init();
    printTM1617("000");//Display it.
    while(1) {
        CLRWDT();//清看门狗
        if(isKeyPressed()) {
            while(isKeyPressed()) {
                printTM1617("   ");//Display it.
                Delay_xms(250);
                printTM1617("000");//Display it.
                Delay_xms(250);
            }
            lastValue = 0; //Clear last value.      250
            resetCounter();//Reset counter.
        } else {
            checkCounter();//Check counter.
            value = getCounter(); //Get counter.
            if(value != lastValue) { //Check value.
                lastValue = value;//Set last value.
                sprintf(buffer,"%03d",value);
                printTM1617(buffer);//Format value and display it.
            }
        }
    }
}
/*******************************************************************************
 * 函数名：interrupt ISR
 * 描述  ：中断函数
 * 输入  ：无
 * 输出  ：无
 * 调用  ：内部调用
 ******************************************************************************/
void interrupt ISR(void)
{

}



