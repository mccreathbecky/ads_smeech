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
static const char *ng0 = "C:/Users/mccre/OneDrive/Documents/2016/Uni/ADS/Project/usb_smeech/Sum_Monitoring.vhd";
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_1547198987_1035706684(char *, char *, char *, char *, char *, char *);
char *ieee_p_1242562249_sub_1547270861_1035706684(char *, char *, char *, char *, char *, char *);
unsigned char ieee_p_1242562249_sub_1781507893_1035706684(char *, char *, char *, int );
char *ieee_p_1242562249_sub_1808404841_1035706684(char *, char *, char *, char *, int );
char *ieee_p_1242562249_sub_1919329317_1035706684(char *, char *, char *, char *, int );
char *ieee_p_1242562249_sub_1919365254_1035706684(char *, char *, char *, char *, int );
char *ieee_p_1242562249_sub_1922276087_1035706684(char *, char *, char *, char *, char *, char *);
char *ieee_p_1242562249_sub_2045698577_1035706684(char *, char *, char *, char *, int );
char *ieee_p_1242562249_sub_2053728113_1035706684(char *, char *, char *, char *, char *, char *);
unsigned char ieee_p_1242562249_sub_2110375371_1035706684(char *, char *, char *, char *, char *);


static void work_a_2551063614_3212880686_p_0(char *t0)
{
    char t8[16];
    char t10[16];
    char t11[16];
    char t30[16];
    char t35[16];
    char t36[16];
    char t37[16];
    char t38[16];
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t9;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned char t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    int t28;
    int t29;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t39;
    char *t40;
    char *t41;

LAB0:    xsi_set_current_line(67, ng0);
    t2 = (t0 + 992U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 5968);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(70, ng0);
    t4 = (t0 + 3272U);
    t9 = *((char **)t4);
    t4 = (t0 + 10996U);
    t12 = (t0 + 1352U);
    t13 = *((char **)t12);
    t12 = (t0 + 10756U);
    t14 = (t0 + 3808U);
    t15 = *((char **)t14);
    t14 = (t0 + 10900U);
    t16 = ieee_p_1242562249_sub_2053728113_1035706684(IEEE_P_1242562249, t11, t13, t12, t15, t14);
    t17 = ieee_p_1242562249_sub_1808404841_1035706684(IEEE_P_1242562249, t10, t16, t11, 60);
    t18 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t8, t9, t4, t17, t10);
    t19 = (t8 + 12U);
    t20 = *((unsigned int *)t19);
    t21 = (1U * t20);
    t22 = (13U != t21);
    if (t22 == 1)
        goto LAB8;

LAB9:    t23 = (t0 + 6080);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t26 = (t25 + 56U);
    t27 = *((char **)t26);
    memcpy(t27, t18, 13U);
    xsi_driver_first_trans_fast(t23);
    xsi_set_current_line(72, ng0);
    t2 = (t0 + 1192U);
    t4 = *((char **)t2);
    t2 = (t0 + 11184);
    t28 = xsi_mem_cmp(t2, t4, 2U);
    if (t28 == 1)
        goto LAB11;

LAB14:    t9 = (t0 + 11186);
    t29 = xsi_mem_cmp(t9, t4, 2U);
    if (t29 == 1)
        goto LAB12;

LAB15:
LAB13:    xsi_set_current_line(86, ng0);
    t2 = (t0 + 2792U);
    t4 = *((char **)t2);
    t2 = (t0 + 10948U);
    t5 = (t0 + 1352U);
    t9 = *((char **)t5);
    t5 = (t0 + 10756U);
    t12 = (t0 + 3808U);
    t13 = *((char **)t12);
    t12 = (t0 + 10900U);
    t14 = ieee_p_1242562249_sub_2053728113_1035706684(IEEE_P_1242562249, t35, t9, t5, t13, t12);
    t15 = ieee_p_1242562249_sub_1808404841_1035706684(IEEE_P_1242562249, t30, t14, t35, 60);
    t16 = ieee_p_1242562249_sub_2045698577_1035706684(IEEE_P_1242562249, t11, t15, t30, 11);
    t17 = ieee_p_1242562249_sub_1547270861_1035706684(IEEE_P_1242562249, t10, t4, t2, t16, t11);
    t18 = (t0 + 1512U);
    t19 = *((char **)t18);
    t18 = (t0 + 10772U);
    t23 = (t0 + 3808U);
    t24 = *((char **)t23);
    t23 = (t0 + 10900U);
    t25 = ieee_p_1242562249_sub_2053728113_1035706684(IEEE_P_1242562249, t38, t19, t18, t24, t23);
    t26 = ieee_p_1242562249_sub_1808404841_1035706684(IEEE_P_1242562249, t37, t25, t38, 60);
    t27 = ieee_p_1242562249_sub_2045698577_1035706684(IEEE_P_1242562249, t36, t26, t37, 11);
    t31 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t8, t17, t10, t27, t36);
    t32 = (t8 + 12U);
    t20 = *((unsigned int *)t32);
    t21 = (1U * t20);
    t1 = (11U != t21);
    if (t1 == 1)
        goto LAB23;

LAB24:    t33 = (t0 + 6144);
    t34 = (t33 + 56U);
    t39 = *((char **)t34);
    t40 = (t39 + 56U);
    t41 = *((char **)t40);
    memcpy(t41, t31, 11U);
    xsi_driver_first_trans_fast(t33);
    xsi_set_current_line(87, ng0);
    t2 = (t0 + 2952U);
    t4 = *((char **)t2);
    t2 = (t0 + 10964U);
    t5 = (t0 + 1512U);
    t9 = *((char **)t5);
    t5 = (t0 + 10772U);
    t12 = (t0 + 3808U);
    t13 = *((char **)t12);
    t12 = (t0 + 10900U);
    t14 = ieee_p_1242562249_sub_2053728113_1035706684(IEEE_P_1242562249, t30, t9, t5, t13, t12);
    t15 = ieee_p_1242562249_sub_1808404841_1035706684(IEEE_P_1242562249, t11, t14, t30, 60);
    t16 = ieee_p_1242562249_sub_2045698577_1035706684(IEEE_P_1242562249, t10, t15, t11, 12);
    t17 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t8, t4, t2, t16, t10);
    t18 = (t8 + 12U);
    t20 = *((unsigned int *)t18);
    t21 = (1U * t20);
    t1 = (12U != t21);
    if (t1 == 1)
        goto LAB25;

LAB26:    t19 = (t0 + 6272);
    t23 = (t19 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t17, 12U);
    xsi_driver_first_trans_fast(t19);
    xsi_set_current_line(88, ng0);
    t2 = (t0 + 3112U);
    t4 = *((char **)t2);
    t2 = (t0 + 10980U);
    t5 = (t0 + 1512U);
    t9 = *((char **)t5);
    t5 = (t0 + 10772U);
    t12 = (t0 + 3808U);
    t13 = *((char **)t12);
    t12 = (t0 + 10900U);
    t14 = ieee_p_1242562249_sub_2053728113_1035706684(IEEE_P_1242562249, t30, t9, t5, t13, t12);
    t15 = ieee_p_1242562249_sub_1808404841_1035706684(IEEE_P_1242562249, t11, t14, t30, 60);
    t16 = ieee_p_1242562249_sub_2045698577_1035706684(IEEE_P_1242562249, t10, t15, t11, 13);
    t17 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t8, t4, t2, t16, t10);
    t18 = (t8 + 12U);
    t20 = *((unsigned int *)t18);
    t21 = (1U * t20);
    t1 = (13U != t21);
    if (t1 == 1)
        goto LAB27;

LAB28:    t19 = (t0 + 6208);
    t23 = (t19 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t17, 13U);
    xsi_driver_first_trans_fast(t19);

LAB10:    goto LAB3;

LAB5:    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_size_not_matching(13U, t21, 0);
    goto LAB9;

LAB11:    xsi_set_current_line(75, ng0);
    t13 = (t0 + 2792U);
    t14 = *((char **)t13);
    t13 = (t0 + 10948U);
    t15 = (t0 + 1352U);
    t16 = *((char **)t15);
    t15 = (t0 + 10756U);
    t17 = (t0 + 3808U);
    t18 = *((char **)t17);
    t17 = (t0 + 10900U);
    t19 = ieee_p_1242562249_sub_2053728113_1035706684(IEEE_P_1242562249, t30, t16, t15, t18, t17);
    t23 = ieee_p_1242562249_sub_1808404841_1035706684(IEEE_P_1242562249, t11, t19, t30, 60);
    t24 = ieee_p_1242562249_sub_2045698577_1035706684(IEEE_P_1242562249, t10, t23, t11, 11);
    t25 = ieee_p_1242562249_sub_1547270861_1035706684(IEEE_P_1242562249, t8, t14, t13, t24, t10);
    t26 = (t8 + 12U);
    t20 = *((unsigned int *)t26);
    t21 = (1U * t20);
    t1 = (11U != t21);
    if (t1 == 1)
        goto LAB17;

LAB18:    t27 = (t0 + 6144);
    t31 = (t27 + 56U);
    t32 = *((char **)t31);
    t33 = (t32 + 56U);
    t34 = *((char **)t33);
    memcpy(t34, t25, 11U);
    xsi_driver_first_trans_fast(t27);
    goto LAB10;

LAB12:    xsi_set_current_line(80, ng0);
    t2 = (t0 + 2792U);
    t4 = *((char **)t2);
    t2 = (t0 + 10948U);
    t5 = (t0 + 1352U);
    t9 = *((char **)t5);
    t5 = (t0 + 10756U);
    t12 = (t0 + 3808U);
    t13 = *((char **)t12);
    t12 = (t0 + 10900U);
    t14 = ieee_p_1242562249_sub_2053728113_1035706684(IEEE_P_1242562249, t35, t9, t5, t13, t12);
    t15 = ieee_p_1242562249_sub_1808404841_1035706684(IEEE_P_1242562249, t30, t14, t35, 60);
    t16 = ieee_p_1242562249_sub_2045698577_1035706684(IEEE_P_1242562249, t11, t15, t30, 11);
    t17 = ieee_p_1242562249_sub_1547270861_1035706684(IEEE_P_1242562249, t10, t4, t2, t16, t11);
    t18 = (t0 + 3688U);
    t19 = *((char **)t18);
    t18 = (t0 + 10884U);
    t23 = (t0 + 3808U);
    t24 = *((char **)t23);
    t23 = (t0 + 10900U);
    t25 = ieee_p_1242562249_sub_2053728113_1035706684(IEEE_P_1242562249, t38, t19, t18, t24, t23);
    t26 = ieee_p_1242562249_sub_1808404841_1035706684(IEEE_P_1242562249, t37, t25, t38, 60);
    t27 = ieee_p_1242562249_sub_2045698577_1035706684(IEEE_P_1242562249, t36, t26, t37, 11);
    t31 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t8, t17, t10, t27, t36);
    t32 = (t8 + 12U);
    t20 = *((unsigned int *)t32);
    t21 = (1U * t20);
    t1 = (11U != t21);
    if (t1 == 1)
        goto LAB19;

LAB20:    t33 = (t0 + 6144);
    t34 = (t33 + 56U);
    t39 = *((char **)t34);
    t40 = (t39 + 56U);
    t41 = *((char **)t40);
    memcpy(t41, t31, 11U);
    xsi_driver_first_trans_fast(t33);
    xsi_set_current_line(81, ng0);
    t2 = (t0 + 3112U);
    t4 = *((char **)t2);
    t2 = (t0 + 10980U);
    t5 = (t0 + 3688U);
    t9 = *((char **)t5);
    t5 = (t0 + 10884U);
    t12 = (t0 + 3808U);
    t13 = *((char **)t12);
    t12 = (t0 + 10900U);
    t14 = ieee_p_1242562249_sub_2053728113_1035706684(IEEE_P_1242562249, t30, t9, t5, t13, t12);
    t15 = ieee_p_1242562249_sub_1808404841_1035706684(IEEE_P_1242562249, t11, t14, t30, 60);
    t16 = ieee_p_1242562249_sub_2045698577_1035706684(IEEE_P_1242562249, t10, t15, t11, 13);
    t17 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t8, t4, t2, t16, t10);
    t18 = (t8 + 12U);
    t20 = *((unsigned int *)t18);
    t21 = (1U * t20);
    t1 = (13U != t21);
    if (t1 == 1)
        goto LAB21;

LAB22:    t19 = (t0 + 6208);
    t23 = (t19 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t17, 13U);
    xsi_driver_first_trans_fast(t19);
    goto LAB10;

LAB16:;
LAB17:    xsi_size_not_matching(11U, t21, 0);
    goto LAB18;

LAB19:    xsi_size_not_matching(11U, t21, 0);
    goto LAB20;

LAB21:    xsi_size_not_matching(13U, t21, 0);
    goto LAB22;

LAB23:    xsi_size_not_matching(11U, t21, 0);
    goto LAB24;

LAB25:    xsi_size_not_matching(12U, t21, 0);
    goto LAB26;

LAB27:    xsi_size_not_matching(13U, t21, 0);
    goto LAB28;

}

static void work_a_2551063614_3212880686_p_1(char *t0)
{
    char t11[16];
    char t12[16];
    char t13[16];
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t14;
    unsigned int t15;
    char *t16;
    unsigned int t17;

LAB0:    xsi_set_current_line(98, ng0);
    t1 = (t0 + 3112U);
    t2 = *((char **)t1);
    t1 = (t0 + 10980U);
    t3 = ieee_p_1242562249_sub_1781507893_1035706684(IEEE_P_1242562249, t2, t1, 0);
    if (t3 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(101, ng0);
    t1 = (t0 + 2952U);
    t2 = *((char **)t1);
    t1 = (t0 + 10964U);
    t4 = ieee_p_1242562249_sub_1919329317_1035706684(IEEE_P_1242562249, t13, t2, t1, 100);
    t5 = (t0 + 3112U);
    t6 = *((char **)t5);
    t5 = (t0 + 10980U);
    t7 = ieee_p_1242562249_sub_1922276087_1035706684(IEEE_P_1242562249, t12, t4, t13, t6, t5);
    t8 = ieee_p_1242562249_sub_2045698577_1035706684(IEEE_P_1242562249, t11, t7, t12, 7);
    t9 = (t0 + 4048U);
    t10 = *((char **)t9);
    t9 = (t10 + 0);
    t14 = (t11 + 12U);
    t15 = *((unsigned int *)t14);
    t15 = (t15 * 1U);
    memcpy(t9, t8, t15);
    xsi_set_current_line(102, ng0);
    t1 = (t0 + 4048U);
    t2 = *((char **)t1);
    t1 = (t0 + 6336);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 7U);
    xsi_driver_first_trans_fast_port(t1);

LAB3:    xsi_set_current_line(105, ng0);
    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t1 = (t0 + 10948U);
    t4 = ieee_p_1242562249_sub_1919329317_1035706684(IEEE_P_1242562249, t13, t2, t1, 100);
    t5 = (t0 + 3568U);
    t6 = *((char **)t5);
    t5 = (t0 + 10868U);
    t7 = ieee_p_1242562249_sub_1922276087_1035706684(IEEE_P_1242562249, t12, t4, t13, t6, t5);
    t8 = ieee_p_1242562249_sub_2045698577_1035706684(IEEE_P_1242562249, t11, t7, t12, 7);
    t9 = (t0 + 4168U);
    t10 = *((char **)t9);
    t9 = (t10 + 0);
    t14 = (t11 + 12U);
    t15 = *((unsigned int *)t14);
    t15 = (t15 * 1U);
    memcpy(t9, t8, t15);
    xsi_set_current_line(106, ng0);
    t1 = (t0 + 4168U);
    t2 = *((char **)t1);
    t1 = (t0 + 6400);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 7U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(107, ng0);
    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t1 = (t0 + 6464);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 11U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(109, ng0);
    t1 = (t0 + 3272U);
    t2 = *((char **)t1);
    t1 = (t0 + 6528);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 13U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(110, ng0);
    t1 = (t0 + 3112U);
    t2 = *((char **)t1);
    t1 = (t0 + 6592);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 13U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(114, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t1 = (t0 + 10932U);
    t4 = (t0 + 3928U);
    t5 = *((char **)t4);
    t4 = (t0 + 10916U);
    t3 = ieee_p_1242562249_sub_2110375371_1035706684(IEEE_P_1242562249, t2, t1, t5, t4);
    if (t3 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(118, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t1 = (t0 + 10932U);
    t4 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t11, t2, t1, 1);
    t5 = (t11 + 12U);
    t15 = *((unsigned int *)t5);
    t17 = (1U * t15);
    t3 = (10U != t17);
    if (t3 == 1)
        goto LAB8;

LAB9:    t6 = (t0 + 6656);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t4, 10U);
    xsi_driver_first_trans_fast(t6);

LAB6:    t1 = (t0 + 5984);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(99, ng0);
    t4 = (t0 + 11188);
    t6 = (t0 + 6336);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t4, 7U);
    xsi_driver_first_trans_fast_port(t6);
    goto LAB3;

LAB5:    xsi_set_current_line(115, ng0);
    t6 = (t0 + 11195);
    t8 = (t0 + 6656);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t14 = (t10 + 56U);
    t16 = *((char **)t14);
    memcpy(t16, t6, 10U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(116, ng0);
    t1 = (t0 + 6720);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB6;

LAB8:    xsi_size_not_matching(10U, t17, 0);
    goto LAB9;

}

static void work_a_2551063614_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    xsi_set_current_line(126, ng0);
    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 6000);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(127, ng0);
    t1 = (t0 + 11205);
    t6 = (t0 + 6784);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 12U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(130, ng0);
    t1 = (t0 + 6848);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

}


extern void work_a_2551063614_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2551063614_3212880686_p_0,(void *)work_a_2551063614_3212880686_p_1,(void *)work_a_2551063614_3212880686_p_2};
	xsi_register_didat("work_a_2551063614_3212880686", "isim/sum_tb_isim_beh.exe.sim/work/a_2551063614_3212880686.didat");
	xsi_register_executes(pe);
}
