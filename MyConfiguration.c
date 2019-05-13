//********************************************************************
//
//      ADC Init Initialization Part
//      4DClass
//      Copyright(C)  2017
//      All rights reserved
//***********************************************************************
#include "MyInclude.h"



/*******************ϵͳ ��ʼ��*********************/
void System_init(void)
{
    OPTION = 0b00000000; //BIT7:���������� 0=���� 1=�ر�
    OSCCON = 0B01010000; //BIT6~BIT4:�����ڲ���Ƶ��ѡ�� 4MHz
    WDTCON = 0B00001001;//BIT4~BIT1:���Ź���λʱ��512ms��bit0--1=������0=�ر�
}

/*******************GPIO ��ʼ��*********************/
void GPIO_Init(void)
{
    //TRISA ����������� PA3ֻ����������
    TRISA0=0;//0=�����1=����
    TRISA1=1;//0=�����1=����
    TRISA2=0;//0=�����1=����
    TRISA4=0;//0=�����1=����
    TRISA5=0;//0=�����1=����
    //WPUA ������������Ҫ��Ҫ���� �ȿ���option��PAPUʹ��������
    WPUA0=0;//1=ʹ��������0=��ֹ����
    WPUA1=1;//1=ʹ��������0=��ֹ����
    WPUA2=1;//1=ʹ��������0=��ֹ����
    WPUA4=1;//1=ʹ��������0=��ֹ����
    WPUA5=1;//1=ʹ��������0=��ֹ����
}


void Delay_xms(unsigned int x)  //����ʱx����
{
    unsigned int i;
    for(i=0; i<x; i++) {
        __delay_ms(1);
        CLRWDT();
    }
}

//��ת�ַ���
static char *reverse(char *s)
{
    char temp;
    char *p = s;    //pָ��s��ͷ��
    char *q = s;    //qָ��s��β��
    while(*q)
        ++q;
    q--;

    //�����ƶ�ָ�룬ֱ��p��q����
    while(q > p) {
        temp = *p;
        *p++ = *q;
        *q-- = temp;
    }
    return s;
}
/*
 * ���ܣ�����ת��Ϊ�ַ���
 * char s[] �������Ǵ洢������ÿһλ
 */
char *my_itoa(int n)
{
    int i = 0,isNegative = 0;
    static char s[10];      //����Ϊstatic������������ȫ�ֱ���
    if((isNegative = n) < 0) { //����Ǹ�������תΪ����
        n = -n;
    }
    do {    //�Ӹ�λ��ʼ��Ϊ�ַ���ֱ�����λ�����Ӧ�÷�ת
        s[i++] = n%10 + '0';
        n = n/10;
    } while(n > 0);

    if(isNegative < 0) { //����Ǹ��������ϸ���
        s[i++] = '-';
    }
    s[i] = '\0';    //�������ַ���������
    return reverse(s);
}

