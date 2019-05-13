//********************************************************************
//
//      KEY Init Initialization Part
//      4DClass
//      Copyright(C)  2017
//      All rights reserved
//***********************************************************************
#include "Myinclude.h"


/*******************************************************************************
 * 函数名：
 * 描述  ：General Definitions
 * 输入  ：无
 * 输出  ：无
 * 调用  ：内部调用
 ******************************************************************************/
//Enable TM1617 STB
#define ENABLE_TM1617()       PA5=0
//Disable TM1617
#define DISABLE_TM1617()      PA5=1

//Clock Low
#define CLOCK_LOW()           PA4=0
//Clock High
#define CLOCK_HIGH()          PA4=1

//Output Low
#define OUTPUT_LOW()          PA2=0
//Output High
#define OUTPUT_HIGH()         PA2=1

//Vector
typedef u16               _VECTOR[3];


/*******************************************************************************
 * 函数名：WriteTM1617
 * 描述  ：写一个u8类型的数据到TM1617
 * 输入  ：无
 * 输出  ：无
 * 调用  ：内部调用
 ******************************************************************************/
void WriteTM1617(u8 value)
{
    u8 i;
    for(i=0; i<8; i++) {
        CLOCK_LOW();
        if((value & 0x01) == 0) {
            OUTPUT_LOW();
        } else {
            OUTPUT_HIGH();
        }
        CLOCK_HIGH();
        value >>= 1;
    }
}

/*******************************************************************************
 * 函数名：显示TM1617
 * 描述  ：写一个u8类型的数据到TM1617
 * 输入  ：无
 * 输出  ：无
 * 调用  ：内部调用
 ******************************************************************************/
void DisplayTM1617(_VECTOR value)
{
    u8 i;

    DISABLE_TM1617();
    CLOCK_HIGH();
    OUTPUT_HIGH();

    ENABLE_TM1617();
    WriteTM1617(0x03);  //显示模式
    DISABLE_TM1617();

    ENABLE_TM1617();
    WriteTM1617(0x40);
    DISABLE_TM1617();

    ENABLE_TM1617();

    WriteTM1617(0xC0);
    for(i = 0; i < 2; i ++) {
        WriteTM1617((u8)(value[i] >> 8));
        WriteTM1617((u8)(value[i] >> 0));
    }
    DISABLE_TM1617();
    ENABLE_TM1617();
    WriteTM1617(0xCC);

    WriteTM1617((u8)(value[2] >> 8));
    WriteTM1617((u8)(value[2] >> 0));
    DISABLE_TM1617();

    ENABLE_TM1617();
    WriteTM1617(0x8C);
    DISABLE_TM1617();
}

/*******************************************************************************
 * 函数名：显示TM1617
 * 描述  ：写一个u8类型的数据到TM1617
 * 输入  ：无
 * 输出  ：无
 * 调用  ：内部调用
 ******************************************************************************/
u16 encodeTM1617(char value)
{
    switch(value) {
    case '0':
        //return 0x1F08;//TM1618
        return 0xF003;//TM1617
    case '1':
        //return 0x0600;//TM1618
        return 0x6000;//TM1617
    case '2':
        //return 0x1B10;//TM1618
        return 0xB005;
    case '3':
        //return 0x0F10;//TM1618
        return 0xF004;
    case '4':
        //return 0x0618;//TM1618
        return 0x6006;
    case '5':
        //return 0x0D18;//TM1618
        return 0xD006;
    case '6':
        //return 0x1D18;//TM1618
        return 0xD007;
    case '7':
        //return 0x0700;//TM1618
        return 0x7000;
    case '8':
        //return 0x1F18;//TM1618
        return 0xF007;
    case '9':
        //return 0x0F18;//TM1618
        return 0xF006;
    default:
        break;
    }
    return 0x0000;
}

/*******************************************************************************
 * 函数名：显示TM1617
 * 描述  ：写一个u8类型的数据到TM1617
 * 输入  ：无
 * 输出  ：无
 * 调用  ：内部调用
 ******************************************************************************/
void printTM1617(char *string)
{
    u8 i,j;
    _VECTOR vector;

    for(i = 0,j = 0; string[i] != '\0' && j < 3; i ++) {
        if(string[i] == '.' && j > 0) {
            vector[j - 1] |= 0x20;
            continue;
        }
        vector[j ++] = encodeTM1617(string[i]);
        if(j >= 3 && string[i + 1] == '.')
            vector[j - 1] |= 0x20;
    }
    DisplayTM1617(vector);
}





















