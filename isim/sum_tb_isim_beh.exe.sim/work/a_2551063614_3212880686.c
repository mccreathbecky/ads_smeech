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
    char t16[16];
    char t20[16];
    char t21[16];
    char t28[16];
    char t35[16];
    char t36[16];
    char t37[16];
    char t38[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    unsigned char t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned char t13;
    unsigned char t14;
    unsigned char t15;
    unsigned int t17;
    unsigned int t18;
    unsigned char t19;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    int t26;
    int t27;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t39;
    char *t40;
    char *t41;

LAB0:    xsi_set_current_line(67, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t1 = (t0 + 10116U);
    t3 = (t0 + 3768U);
    t4 = *((char **)t3);
    t3 = (t0 + 10100U);
    t5 = ieee_p_1242562249_sub_2110375371_1035706684(IEEE_P_1242562249, t2, t1, t4, t3);
    if (t5 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t13 = xsi_signal_has_event(t1);
    if (t13 == 1)
        goto LAB7;

LAB8:    t5 = (unsigned char)0;

LAB9:    if (t5 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 5560);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(68, ng0);
    t6 = (t0 + 10367);
    t8 = (t0 + 5656);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t6, 10U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(69, ng0);
    t1 = (t0 + 10377);
    t3 = (t0 + 5720);
    t4 = (t3 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 12U);
    xsi_driver_first_trans_fast(t3);
    xsi_set_current_line(70, ng0);
    t1 = (t0 + 10389);
    t3 = (t0 + 5784);
    t4 = (t3 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 13U);
    xsi_driver_first_trans_fast(t3);
    xsi_set_current_line(71, ng0);
    t1 = (t0 + 10402);
    t3 = (t0 + 5848);
    t4 = (t3 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 13U);
    xsi_driver_first_trans_fast(t3);
    goto LAB3;

LAB5:    xsi_set_current_line(75, ng0);
    t2 = (t0 + 2472U);
    t4 = *((char **)t2);
    t2 = (t0 + 10116U);
    t6 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t16, t4, t2, 1);
    t7 = (t16 + 12U);
    t17 = *((unsigned int *)t7);
    t18 = (1U * t17);
    t19 = (10U != t18);
    if (t19 == 1)
        goto LAB10;

LAB11:    t8 = (t0 + 5656);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t6, 10U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(78, ng0);
    t1 = (t0 + 3112U);
    t2 = *((char **)t1);
    t1 = (t0 + 10180U);
    t3 = (t0 + 1352U);
    t4 = *((char **)t3);
    t3 = (t0 + 9940U);
    t6 = (t0 + 3648U);
    t7 = *((char **)t6);
    t6 = (t0 + 10084U);
    t8 = ieee_p_1242562249_sub_2053728113_1035706684(IEEE_P_1242562249, t21, t4, t3, t7, t6);
    t9 = ieee_p_1242562249_sub_1808404841_1035706684(IEEE_P_1242562249, t20, t8, t21, 60);
    t10 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t16, t2, t1, t9, t20);
    t11 = (t16 + 12U);
    t17 = *((unsigned int *)t11);
    t18 = (1U * t17);
    t5 = (13U != t18);
    if (t5 == 1)
        goto LAB12;

LAB13:    t12 = (t0 + 5848);
    t22 = (t12 + 56U);
    t23 = *((char **)t22);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    memcpy(t25, t10, 13U);
    xsi_driver_first_trans_fast(t12);
    xsi_set_current_line(80, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 10415);
    t26 = xsi_mem_cmp(t1, t2, 2U);
    if (t26 == 1)
        goto LAB15;

LAB18:    t4 = (t0 + 10417);
    t27 = xsi_mem_cmp(t4, t2, 2U);
    if (t27 == 1)
        goto LAB16;

LAB19:
LAB17:    xsi_set_current_line(94, ng0);
    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t1 = (t0 + 10132U);
    t3 = (t0 + 1352U);
    t4 = *((char **)t3);
    t3 = (t0 + 9940U);
    t6 = (t0 + 3648U);
    t7 = *((char **)t6);
    t6 = (t0 + 10084U);
    t8 = ieee_p_1242562249_sub_2053728113_1035706684(IEEE_P_1242562249, t35, t4, t3, t7, t6);
    t9 = ieee_p_1242562249_sub_1808404841_1035706684(IEEE_P_1242562249, t28, t8, t35, 60);
    t10 = ieee_p_1242562249_sub_2045698577_1035706684(IEEE_P_1242562249, t21, t9, t28, 11);
    t11 = ieee_p_1242562249_sub_1547270861_1035706684(IEEE_P_1242562249, t20, t2, t1, t10, t21);
    t12 = (t0 + 1512U);
    t22 = *((char **)t12);
    t12 = (t0 + 9956U);
    t23 = (t0 + 3648U);
    t24 = *((char **)t23);
    t23 = (t0 + 10084U);
    t25 = ieee_p_1242562249_sub_2053728113_1035706684(IEEE_P_1242562249, t38, t22, t12, t24, t23);
    t29 = ieee_p_1242562249_sub_1808404841_1035706684(IEEE_P_1242562249, t37, t25, t38, 60);
    t30 = ieee_p_1242562249_sub_2045698577_1035706684(IEEE_P_1242562249, t36, t29, t37, 11);
    t31 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t16, t11, t20, t30, t36);
    t32 = (t16 + 12U);
    t17 = *((unsigned int *)t32);
    t18 = (1U * t17);
    t5 = (11U != t18);
    if (t5 == 1)
        goto LAB27;

LAB28:    t33 = (t0 + 5912);
    t34 = (t33 + 56U);
    t39 = *((char **)t34);
    t40 = (t39 + 56U);
    t41 = *((char **)t40);
    memcpy(t41, t31, 11U);
    xsi_driver_first_trans_fast(t33);
    xsi_set_current_line(95, ng0);
    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t1 = (t0 + 10148U);
    t3 = (t0 + 1512U);
    t4 = *((char **)t3);
    t3 = (t0 + 9956U);
    t6 = (t0 + 3648U);
    t7 = *((char **)t6);
    t6 = (t0 + 10084U);
    t8 = ieee_p_1242562249_sub_2053728113_1035706684(IEEE_P_1242562249, t28, t4, t3, t7, t6);
    t9 = ieee_p_1242562249_sub_1808404841_1035706684(IEEE_P_1242562249, t21, t8, t28, 60);
    t10 = ieee_p_1242562249_sub_2045698577_1035706684(IEEE_P_1242562249, t20, t9, t21, 12);
    t11 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t16, t2, t1, t10, t20);
    t12 = (t16 + 12U);
    t17 = *((unsigned int *)t12);
    t18 = (1U * t17);
    t5 = (12U != t18);
    if (t5 == 1)
        goto LAB29;

LAB30:    t22 = (t0 + 5720);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t29 = *((char **)t25);
    memcpy(t29, t11, 12U);
    xsi_driver_first_trans_fast(t22);
    xsi_set_current_line(96, ng0);
    t1 = (t0 + 2952U);
    t2 = *((char **)t1);
    t1 = (t0 + 10164U);
    t3 = (t0 + 1512U);
    t4 = *((char **)t3);
    t3 = (t0 + 9956U);
    t6 = (t0 + 3648U);
    t7 = *((char **)t6);
    t6 = (t0 + 10084U);
    t8 = ieee_p_1242562249_sub_2053728113_1035706684(IEEE_P_1242562249, t28, t4, t3, t7, t6);
    t9 = ieee_p_1242562249_sub_1808404841_1035706684(IEEE_P_1242562249, t21, t8, t28, 60);
    t10 = ieee_p_1242562249_sub_2045698577_1035706684(IEEE_P_1242562249, t20, t9, t21, 13);
    t11 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t16, t2, t1, t10, t20);
    t12 = (t16 + 12U);
    t17 = *((unsigned int *)t12);
    t18 = (1U * t17);
    t5 = (13U != t18);
    if (t5 == 1)
        goto LAB31;

LAB32:    t22 = (t0 + 5784);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t29 = *((char **)t25);
    memcpy(t29, t11, 13U);
    xsi_driver_first_trans_fast(t22);

LAB14:    goto LAB3;

LAB7:    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t14 = *((unsigned char *)t3);
    t15 = (t14 == (unsigned char)3);
    t5 = t15;
    goto LAB9;

LAB10:    xsi_size_not_matching(10U, t18, 0);
    goto LAB11;

LAB12:    xsi_size_not_matching(13U, t18, 0);
    goto LAB13;

LAB15:    xsi_set_current_line(83, ng0);
    t7 = (t0 + 2632U);
    t8 = *((char **)t7);
    t7 = (t0 + 10132U);
    t9 = (t0 + 1352U);
    t10 = *((char **)t9);
    t9 = (t0 + 9940U);
    t11 = (t0 + 3648U);
    t12 = *((char **)t11);
    t11 = (t0 + 10084U);
    t22 = ieee_p_1242562249_sub_2053728113_1035706684(IEEE_P_1242562249, t28, t10, t9, t12, t11);
    t23 = ieee_p_1242562249_sub_1808404841_1035706684(IEEE_P_1242562249, t21, t22, t28, 60);
    t24 = ieee_p_1242562249_sub_2045698577_1035706684(IEEE_P_1242562249, t20, t23, t21, 11);
    t25 = ieee_p_1242562249_sub_1547270861_1035706684(IEEE_P_1242562249, t16, t8, t7, t24, t20);
    t29 = (t16 + 12U);
    t17 = *((unsigned int *)t29);
    t18 = (1U * t17);
    t5 = (11U != t18);
    if (t5 == 1)
        goto LAB21;

LAB22:    t30 = (t0 + 5912);
    t31 = (t30 + 56U);
    t32 = *((char **)t31);
    t33 = (t32 + 56U);
    t34 = *((char **)t33);
    memcpy(t34, t25, 11U);
    xsi_driver_first_trans_fast(t30);
    goto LAB14;

LAB16:    xsi_set_current_line(88, ng0);
    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t1 = (t0 + 10132U);
    t3 = (t0 + 1352U);
    t4 = *((char **)t3);
    t3 = (t0 + 9940U);
    t6 = (t0 + 3648U);
    t7 = *((char **)t6);
    t6 = (t0 + 10084U);
    t8 = ieee_p_1242562249_sub_2053728113_1035706684(IEEE_P_1242562249, t35, t4, t3, t7, t6);
    t9 = ieee_p_1242562249_sub_1808404841_1035706684(IEEE_P_1242562249, t28, t8, t35, 60);
    t10 = ieee_p_1242562249_sub_2045698577_1035706684(IEEE_P_1242562249, t21, t9, t28, 11);
    t11 = ieee_p_1242562249_sub_1547270861_1035706684(IEEE_P_1242562249, t20, t2, t1, t10, t21);
    t12 = (t0 + 3528U);
    t22 = *((char **)t12);
    t12 = (t0 + 10068U);
    t23 = (t0 + 3648U);
    t24 = *((char **)t23);
    t23 = (t0 + 10084U);
    t25 = ieee_p_1242562249_sub_2053728113_1035706684(IEEE_P_1242562249, t38, t22, t12, t24, t23);
    t29 = ieee_p_1242562249_sub_1808404841_1035706684(IEEE_P_1242562249, t37, t25, t38, 60);
    t30 = ieee_p_1242562249_sub_2045698577_1035706684(IEEE_P_1242562249, t36, t29, t37, 11);
    t31 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t16, t11, t20, t30, t36);
    t32 = (t16 + 12U);
    t17 = *((unsigned int *)t32);
    t18 = (1U * t17);
    t5 = (11U != t18);
    if (t5 == 1)
        goto LAB23;

LAB24:    t33 = (t0 + 5912);
    t34 = (t33 + 56U);
    t39 = *((char **)t34);
    t40 = (t39 + 56U);
    t41 = *((char **)t40);
    memcpy(t41, t31, 11U);
    xsi_driver_first_trans_fast(t33);
    xsi_set_current_line(89, ng0);
    t1 = (t0 + 2952U);
    t2 = *((char **)t1);
    t1 = (t0 + 10164U);
    t3 = (t0 + 3528U);
    t4 = *((char **)t3);
    t3 = (t0 + 10068U);
    t6 = (t0 + 3648U);
    t7 = *((char **)t6);
    t6 = (t0 + 10084U);
    t8 = ieee_p_1242562249_sub_2053728113_1035706684(IEEE_P_1242562249, t28, t4, t3, t7, t6);
    t9 = ieee_p_1242562249_sub_1808404841_1035706684(IEEE_P_1242562249, t21, t8, t28, 60);
    t10 = ieee_p_1242562249_sub_2045698577_1035706684(IEEE_P_1242562249, t20, t9, t21, 13);
    t11 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t16, t2, t1, t10, t20);
    t12 = (t16 + 12U);
    t17 = *((unsigned int *)t12);
    t18 = (1U * t17);
    t5 = (13U != t18);
    if (t5 == 1)
        goto LAB25;

LAB26:    t22 = (t0 + 5784);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t29 = *((char **)t25);
    memcpy(t29, t11, 13U);
    xsi_driver_first_trans_fast(t22);
    goto LAB14;

LAB20:;
LAB21:    xsi_size_not_matching(11U, t18, 0);
    goto LAB22;

LAB23:    xsi_size_not_matching(11U, t18, 0);
    goto LAB24;

LAB25:    xsi_size_not_matching(13U, t18, 0);
    goto LAB26;

LAB27:    xsi_size_not_matching(11U, t18, 0);
    goto LAB28;

LAB29:    xsi_size_not_matching(12U, t18, 0);
    goto LAB30;

LAB31:    xsi_size_not_matching(13U, t18, 0);
    goto LAB32;

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

LAB0:    xsi_set_current_line(108, ng0);
    t1 = (t0 + 2952U);
    t2 = *((char **)t1);
    t1 = (t0 + 10164U);
    t3 = ieee_p_1242562249_sub_1781507893_1035706684(IEEE_P_1242562249, t2, t1, 0);
    if (t3 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(111, ng0);
    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t1 = (t0 + 10148U);
    t4 = ieee_p_1242562249_sub_1919329317_1035706684(IEEE_P_1242562249, t13, t2, t1, 100);
    t5 = (t0 + 2952U);
    t6 = *((char **)t5);
    t5 = (t0 + 10164U);
    t7 = ieee_p_1242562249_sub_1922276087_1035706684(IEEE_P_1242562249, t12, t4, t13, t6, t5);
    t8 = ieee_p_1242562249_sub_2045698577_1035706684(IEEE_P_1242562249, t11, t7, t12, 7);
    t9 = (t0 + 3888U);
    t10 = *((char **)t9);
    t9 = (t10 + 0);
    t14 = (t11 + 12U);
    t15 = *((unsigned int *)t14);
    t15 = (t15 * 1U);
    memcpy(t9, t8, t15);
    xsi_set_current_line(112, ng0);
    t1 = (t0 + 3888U);
    t2 = *((char **)t1);
    t1 = (t0 + 5976);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 7U);
    xsi_driver_first_trans_fast_port(t1);

LAB3:    xsi_set_current_line(115, ng0);
    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t1 = (t0 + 10132U);
    t4 = ieee_p_1242562249_sub_1919329317_1035706684(IEEE_P_1242562249, t13, t2, t1, 100);
    t5 = (t0 + 3408U);
    t6 = *((char **)t5);
    t5 = (t0 + 10052U);
    t7 = ieee_p_1242562249_sub_1922276087_1035706684(IEEE_P_1242562249, t12, t4, t13, t6, t5);
    t8 = ieee_p_1242562249_sub_2045698577_1035706684(IEEE_P_1242562249, t11, t7, t12, 7);
    t9 = (t0 + 4008U);
    t10 = *((char **)t9);
    t9 = (t10 + 0);
    t14 = (t11 + 12U);
    t15 = *((unsigned int *)t14);
    t15 = (t15 * 1U);
    memcpy(t9, t8, t15);
    xsi_set_current_line(116, ng0);
    t1 = (t0 + 4008U);
    t2 = *((char **)t1);
    t1 = (t0 + 6040);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 7U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(117, ng0);
    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t1 = (t0 + 6104);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 11U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(119, ng0);
    t1 = (t0 + 3112U);
    t2 = *((char **)t1);
    t1 = (t0 + 6168);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 13U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(120, ng0);
    t1 = (t0 + 2952U);
    t2 = *((char **)t1);
    t1 = (t0 + 6232);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 13U);
    xsi_driver_first_trans_fast_port(t1);
    t1 = (t0 + 5576);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(109, ng0);
    t4 = (t0 + 10419);
    t6 = (t0 + 5976);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t4, 7U);
    xsi_driver_first_trans_fast_port(t6);
    goto LAB3;

}


extern void work_a_2551063614_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2551063614_3212880686_p_0,(void *)work_a_2551063614_3212880686_p_1};
	xsi_register_didat("work_a_2551063614_3212880686", "isim/sum_tb_isim_beh.exe.sim/work/a_2551063614_3212880686.didat");
	xsi_register_executes(pe);
}
