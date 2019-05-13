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
 * 函数名：isKeyPressed
 * 描述  ：判断学习按键状态
 * 输入  ：无
 * 输出  ：无
 * 调用  ：内部调用
 ******************************************************************************/
u8 isKeyPressed(void)  //判断学习按键状态
{
    return  (INPUT==0) ? 1:0;
}
/*******************************************************************************
 * 函数名：KEY_Scan
 * 描述  ：按判断拨码开关状态
 * 输入  ：无
 * 输出  ：无
 * 调用  ：内部调用
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
void checkCounter(void)  //判断拨码开关状态
{
    if(PA3 == 0) return;
    while(1) {
        Delay_xms(10);
        if(PA3 == 0) break;
    }
    doCount();
}