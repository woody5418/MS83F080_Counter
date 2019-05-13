//********************************************************************
//
//      KEY Init Initialization Part
//      4DClass
//      Copyright(C)  2017
//      All rights reserved
//***********************************************************************
#include "Myinclude.h"
//Max Value
#define MAX_VALUE            999

//Local Counter
static u16 localCounter      = 0;
/*******************************************************************************
 * ��������isKeyPressed
 * ����  ���ж�ѧϰ����״̬
 * ����  ����
 * ���  ����
 * ����  ���ڲ�����
 ******************************************************************************/
u8 isKeyPressed(void)  //�ж�ѧϰ����״̬
{
    return  (INPUT==0) ? 1:0;
}
/*******************************************************************************
 * ��������KEY_Scan
 * ����  �����жϲ��뿪��״̬
 * ����  ����
 * ���  ����
 * ����  ���ڲ�����
 ******************************************************************************/

u16 getCounter(void)
{
    //Return result.
    return localCounter;
}
void resetCounter(void)
{
    //Clear local counter.
    localCounter = 0;
}
void doCount(void)
{
    //Check overflow.
    if(localCounter != MAX_VALUE) {
        //Add local counter.
        localCounter ++;
    } else {
        //Reset local counter.
        localCounter = 0;
    }
}
void checkCounter(void)  //�жϲ��뿪��״̬
{
    if(PA3 == 0) return;
    while(1) {
        Delay_xms(10);
        if(PA3 == 0) break;
    }
    doCount();
}