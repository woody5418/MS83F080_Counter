//********************************************************************
//
//      ADC Init Initialization Part
//      4DClass
//      Copyright(C)  2017
//      All rights reserved
//***********************************************************************
#include "MyInclude.h"



/*******************系统 初始化*********************/
void System_init(void)
{
    OPTION = 0b00000000; //BIT7:开启总上拉 0=开启 1=关闭
    OSCCON = 0B01010000; //BIT6~BIT4:设置内部振荡频率选择 4MHz
    WDTCON = 0B00001001;//BIT4~BIT1:看门狗复位时间512ms，bit0--1=开启，0=关闭
}

/*******************GPIO 初始化*********************/
void GPIO_Init(void)
{
    //TRISA 配置输入输出 PA3只做输入引脚
    TRISA0=0;//0=输出，1=输入
    TRISA1=1;//0=输出，1=输入
    TRISA2=0;//0=输出，1=输入
    TRISA4=0;//0=输出，1=输入
    TRISA5=0;//0=输出，1=输入
    //WPUA 配置输入引脚要不要上拉 先开启option的PAPU使能总上拉
    WPUA0=0;//1=使能上拉，0=禁止上拉
    WPUA1=1;//1=使能上拉，0=禁止上拉
    WPUA2=1;//1=使能上拉，0=禁止上拉
    WPUA4=1;//1=使能上拉，0=禁止上拉
    WPUA5=1;//1=使能上拉，0=禁止上拉
}


void Delay_xms(unsigned int x)  //死延时x毫秒
{
    unsigned int i;
    for(i=0; i<x; i++) {
        __delay_ms(1);
        CLRWDT();
    }
}

//反转字符串
static char *reverse(char *s)
{
    char temp;
    char *p = s;    //p指向s的头部
    char *q = s;    //q指向s的尾部
    while(*q)
        ++q;
    q--;

    //交换移动指针，直到p和q交叉
    while(q > p) {
        temp = *p;
        *p++ = *q;
        *q-- = temp;
    }
    return s;
}
/*
 * 功能：整数转换为字符串
 * char s[] 的作用是存储整数的每一位
 */
char *my_itoa(int n)
{
    int i = 0,isNegative = 0;
    static char s[10];      //必须为static变量，或者是全局变量
    if((isNegative = n) < 0) { //如果是负数，先转为正数
        n = -n;
    }
    do {    //从各位开始变为字符，直到最高位，最后应该反转
        s[i++] = n%10 + '0';
        n = n/10;
    } while(n > 0);

    if(isNegative < 0) { //如果是负数，补上负号
        s[i++] = '-';
    }
    s[i] = '\0';    //最后加上字符串结束符
    return reverse(s);
}

