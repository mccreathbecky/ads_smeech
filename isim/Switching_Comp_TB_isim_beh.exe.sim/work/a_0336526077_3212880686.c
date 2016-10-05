/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/mccre/OneDrive/Documents/2016/Uni/ADS/Project/SMEECH2/Switching_Comp.vhd";
extern char *IEEE_P_1242562249;

unsigned char ieee_p_1242562249_sub_1781543830_1035706684(char *, char *, char *, int );
unsigned char ieee_p_1242562249_sub_3469716711_1035706684(char *, char *, char *, char *, char *);
unsigned char ieee_p_1242562249_sub_3472088553_1035706684(char *, char *, char *, char *, char *);


static void work_a_0336526077_3212880686_p_0(char *t0)
{
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    unsigned char t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;

LAB0:    xsi_set_current_line(63, ng0);
    t2 = (t0 + 992U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 3672);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(64, ng0);
    t4 = (t0 + 1352U);
    t8 = *((char **)t4);
    t9 = *((unsigned char *)t8);
    t10 = (t9 == (unsigned char)2);
    if (t10 != 0)
        goto LAB8;

LAB10:
LAB9:    goto LAB3;

LAB5:    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_set_current_line(68, ng0);
    t4 = (t0 + 1672U);
    t11 = *((char **)t4);
    t4 = (t0 + 6392U);
    t12 = (t0 + 2368U);
    t13 = *((char **)t12);
    t12 = (t0 + 6440U);
    t14 = ieee_p_1242562249_sub_3472088553_1035706684(IEEE_P_1242562249, t11, t4, t13, t12);
    if (t14 != 0)
        goto LAB11;

LAB13:    t2 = (t0 + 1672U);
    t4 = *((char **)t2);
    t2 = (t0 + 6392U);
    t5 = (t0 + 2248U);
    t8 = *((char **)t5);
    t5 = (t0 + 6424U);
    t1 = ieee_p_1242562249_sub_3469716711_1035706684(IEEE_P_1242562249, t4, t2, t8, t5);
    if (t1 != 0)
        goto LAB14;

LAB15:    t2 = (t0 + 1192U);
    t4 = *((char **)t2);
    t2 = (t0 + 6360U);
    t1 = ieee_p_1242562249_sub_1781543830_1035706684(IEEE_P_1242562249, t4, t2, 0);
    if (t1 != 0)
        goto LAB16;

LAB17:    xsi_set_current_line(81, ng0);
    t2 = (t0 + 6527);
    t5 = (t0 + 3752);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t2, 2U);
    xsi_driver_first_trans_fast_port(t5);

LAB12:    xsi_set_current_line(87, ng0);
    t2 = (t0 + 3816);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t2);
    goto LAB9;

LAB11:    xsi_set_current_line(69, ng0);
    t15 = (t0 + 6521);
    t17 = (t0 + 3752);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    memcpy(t21, t15, 2U);
    xsi_driver_first_trans_fast_port(t17);
    goto LAB12;

LAB14:    xsi_set_current_line(73, ng0);
    t11 = (t0 + 6523);
    t13 = (t0 + 3752);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t11, 2U);
    xsi_driver_first_trans_fast_port(t13);
    goto LAB12;

LAB16:    xsi_set_current_line(77, ng0);
    t5 = (t0 + 6525);
    t11 = (t0 + 3752);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t5, 2U);
    xsi_driver_first_trans_fast_port(t11);
    goto LAB12;

}


extern void work_a_0336526077_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0336526077_3212880686_p_0};
	xsi_register_didat("work_a_0336526077_3212880686", "isim/Switching_Comp_TB_isim_beh.exe.sim/work/a_0336526077_3212880686.didat");
	xsi_register_executes(pe);
}
