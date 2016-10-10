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
static const char *ng0 = "C:/Users/mccre/OneDrive/Documents/2016/Uni/ADS/Project/SMEECH2/Sum_Monitoring.vhd";
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_1547198987_1035706684(char *, char *, char *, char *, char *, char *);
char *ieee_p_1242562249_sub_1547270861_1035706684(char *, char *, char *, char *, char *, char *);
char *ieee_p_1242562249_sub_1808404841_1035706684(char *, char *, char *, char *, int );
char *ieee_p_1242562249_sub_2053728113_1035706684(char *, char *, char *, char *, char *, char *);


static void work_a_2551063614_3212880686_p_0(char *t0)
{
    char t8[16];
    char t10[16];
    char t11[16];
    char t33[16];
    char t34[16];
    char t35[16];
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
    char *t30;
    char *t31;
    char *t32;
    char *t36;
    char *t37;

LAB0:    xsi_set_current_line(63, ng0);
    t2 = (t0 + 1472U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(87, ng0);
    t2 = xsi_get_transient_memory(11U);
    memset(t2, 0, 11U);
    t4 = t2;
    memset(t4, (unsigned char)4, 11U);
    t5 = (t0 + 5112);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t2, 11U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(88, ng0);
    t2 = xsi_get_transient_memory(13U);
    memset(t2, 0, 13U);
    t4 = t2;
    memset(t4, (unsigned char)4, 13U);
    t5 = (t0 + 5176);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t2, 13U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(89, ng0);
    t2 = xsi_get_transient_memory(12U);
    memset(t2, 0, 12U);
    t4 = t2;
    memset(t4, (unsigned char)4, 12U);
    t5 = (t0 + 5240);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t2, 12U);
    xsi_driver_first_trans_fast_port(t5);

LAB3:    t2 = (t0 + 4760);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(66, ng0);
    t4 = (t0 + 1192U);
    t9 = *((char **)t4);
    t4 = (t0 + 8520U);
    t12 = (t0 + 1992U);
    t13 = *((char **)t12);
    t12 = (t0 + 8568U);
    t14 = (t0 + 3088U);
    t15 = *((char **)t14);
    t14 = (t0 + 8600U);
    t16 = ieee_p_1242562249_sub_2053728113_1035706684(IEEE_P_1242562249, t11, t13, t12, t15, t14);
    t17 = ieee_p_1242562249_sub_1808404841_1035706684(IEEE_P_1242562249, t10, t16, t11, 60);
    t18 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t8, t9, t4, t17, t10);
    t19 = (t8 + 12U);
    t20 = *((unsigned int *)t19);
    t21 = (1U * t20);
    t22 = (13U != t21);
    if (t22 == 1)
        goto LAB8;

LAB9:    t23 = (t0 + 4856);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t26 = (t25 + 56U);
    t27 = *((char **)t26);
    memcpy(t27, t18, 13U);
    xsi_driver_first_trans_fast(t23);
    xsi_set_current_line(68, ng0);
    t2 = (t0 + 1832U);
    t4 = *((char **)t2);
    t2 = (t0 + 8726);
    t28 = xsi_mem_cmp(t2, t4, 2U);
    if (t28 == 1)
        goto LAB11;

LAB14:    t9 = (t0 + 8728);
    t29 = xsi_mem_cmp(t9, t4, 2U);
    if (t29 == 1)
        goto LAB12;

LAB15:
LAB13:    xsi_set_current_line(80, ng0);
    t2 = (t0 + 1032U);
    t4 = *((char **)t2);
    t2 = (t0 + 8504U);
    t5 = (t0 + 1992U);
    t9 = *((char **)t5);
    t5 = (t0 + 8568U);
    t12 = (t0 + 3088U);
    t13 = *((char **)t12);
    t12 = (t0 + 8600U);
    t14 = ieee_p_1242562249_sub_2053728113_1035706684(IEEE_P_1242562249, t33, t9, t5, t13, t12);
    t15 = ieee_p_1242562249_sub_1808404841_1035706684(IEEE_P_1242562249, t11, t14, t33, 60);
    t16 = ieee_p_1242562249_sub_1547270861_1035706684(IEEE_P_1242562249, t10, t4, t2, t15, t11);
    t17 = (t0 + 2152U);
    t18 = *((char **)t17);
    t17 = (t0 + 8584U);
    t19 = (t0 + 3088U);
    t23 = *((char **)t19);
    t19 = (t0 + 8600U);
    t24 = ieee_p_1242562249_sub_2053728113_1035706684(IEEE_P_1242562249, t35, t18, t17, t23, t19);
    t25 = ieee_p_1242562249_sub_1808404841_1035706684(IEEE_P_1242562249, t34, t24, t35, 60);
    t26 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t8, t16, t10, t25, t34);
    t27 = (t8 + 12U);
    t20 = *((unsigned int *)t27);
    t21 = (1U * t20);
    t1 = (11U != t21);
    if (t1 == 1)
        goto LAB21;

LAB22:    t30 = (t0 + 4920);
    t31 = (t30 + 56U);
    t32 = *((char **)t31);
    t36 = (t32 + 56U);
    t37 = *((char **)t36);
    memcpy(t37, t26, 11U);
    xsi_driver_first_trans_fast(t30);
    xsi_set_current_line(81, ng0);
    t2 = (t0 + 1352U);
    t4 = *((char **)t2);
    t2 = (t0 + 8536U);
    t5 = (t0 + 2152U);
    t9 = *((char **)t5);
    t5 = (t0 + 8584U);
    t12 = (t0 + 3088U);
    t13 = *((char **)t12);
    t12 = (t0 + 8600U);
    t14 = ieee_p_1242562249_sub_2053728113_1035706684(IEEE_P_1242562249, t11, t9, t5, t13, t12);
    t15 = ieee_p_1242562249_sub_1808404841_1035706684(IEEE_P_1242562249, t10, t14, t11, 60);
    t16 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t8, t4, t2, t15, t10);
    t17 = (t8 + 12U);
    t20 = *((unsigned int *)t17);
    t21 = (1U * t20);
    t1 = (12U != t21);
    if (t1 == 1)
        goto LAB23;

LAB24:    t18 = (t0 + 4984);
    t19 = (t18 + 56U);
    t23 = *((char **)t19);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    memcpy(t25, t16, 12U);
    xsi_driver_first_trans_fast(t18);

LAB10:    xsi_set_current_line(84, ng0);
    t2 = (t0 + 5048);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    goto LAB3;

LAB5:    t4 = (t0 + 1512U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_size_not_matching(13U, t21, 0);
    goto LAB9;

LAB11:    xsi_set_current_line(71, ng0);
    t13 = (t0 + 1032U);
    t14 = *((char **)t13);
    t13 = (t0 + 8504U);
    t15 = (t0 + 1992U);
    t16 = *((char **)t15);
    t15 = (t0 + 8568U);
    t17 = (t0 + 3088U);
    t18 = *((char **)t17);
    t17 = (t0 + 8600U);
    t19 = ieee_p_1242562249_sub_2053728113_1035706684(IEEE_P_1242562249, t11, t16, t15, t18, t17);
    t23 = ieee_p_1242562249_sub_1808404841_1035706684(IEEE_P_1242562249, t10, t19, t11, 60);
    t24 = ieee_p_1242562249_sub_1547270861_1035706684(IEEE_P_1242562249, t8, t14, t13, t23, t10);
    t25 = (t8 + 12U);
    t20 = *((unsigned int *)t25);
    t21 = (1U * t20);
    t1 = (11U != t21);
    if (t1 == 1)
        goto LAB17;

LAB18:    t26 = (t0 + 4920);
    t27 = (t26 + 56U);
    t30 = *((char **)t27);
    t31 = (t30 + 56U);
    t32 = *((char **)t31);
    memcpy(t32, t24, 11U);
    xsi_driver_first_trans_fast(t26);
    goto LAB10;

LAB12:    xsi_set_current_line(75, ng0);
    t2 = (t0 + 1032U);
    t4 = *((char **)t2);
    t2 = (t0 + 8504U);
    t5 = (t0 + 1992U);
    t9 = *((char **)t5);
    t5 = (t0 + 8568U);
    t12 = (t0 + 3088U);
    t13 = *((char **)t12);
    t12 = (t0 + 8600U);
    t14 = ieee_p_1242562249_sub_2053728113_1035706684(IEEE_P_1242562249, t33, t9, t5, t13, t12);
    t15 = ieee_p_1242562249_sub_1808404841_1035706684(IEEE_P_1242562249, t11, t14, t33, 60);
    t16 = ieee_p_1242562249_sub_1547270861_1035706684(IEEE_P_1242562249, t10, t4, t2, t15, t11);
    t17 = (t0 + 3208U);
    t18 = *((char **)t17);
    t17 = (t0 + 8616U);
    t19 = (t0 + 3088U);
    t23 = *((char **)t19);
    t19 = (t0 + 8600U);
    t24 = ieee_p_1242562249_sub_2053728113_1035706684(IEEE_P_1242562249, t35, t18, t17, t23, t19);
    t25 = ieee_p_1242562249_sub_1808404841_1035706684(IEEE_P_1242562249, t34, t24, t35, 60);
    t26 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t8, t16, t10, t25, t34);
    t27 = (t8 + 12U);
    t20 = *((unsigned int *)t27);
    t21 = (1U * t20);
    t1 = (11U != t21);
    if (t1 == 1)
        goto LAB19;

LAB20:    t30 = (t0 + 4920);
    t31 = (t30 + 56U);
    t32 = *((char **)t31);
    t36 = (t32 + 56U);
    t37 = *((char **)t36);
    memcpy(t37, t26, 11U);
    xsi_driver_first_trans_fast(t30);
    goto LAB10;

LAB16:;
LAB17:    xsi_size_not_matching(11U, t21, 0);
    goto LAB18;

LAB19:    xsi_size_not_matching(11U, t21, 0);
    goto LAB20;

LAB21:    xsi_size_not_matching(11U, t21, 0);
    goto LAB22;

LAB23:    xsi_size_not_matching(12U, t21, 0);
    goto LAB24;

}

static void work_a_2551063614_3212880686_p_1(char *t0)
{
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;

LAB0:    xsi_set_current_line(95, ng0);
    t2 = (t0 + 2752U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 4776);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(96, ng0);
    t4 = (t0 + 2312U);
    t8 = *((char **)t4);
    t4 = (t0 + 5304);
    t9 = (t4 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t8, 11U);
    xsi_driver_first_trans_fast_port(t4);
    xsi_set_current_line(97, ng0);
    t2 = (t0 + 2472U);
    t4 = *((char **)t2);
    t2 = (t0 + 5368);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t4, 13U);
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(98, ng0);
    t2 = (t0 + 2632U);
    t4 = *((char **)t2);
    t2 = (t0 + 5432);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t4, 12U);
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(100, ng0);
    t2 = (t0 + 5496);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    goto LAB3;

LAB5:    t4 = (t0 + 2792U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

}


extern void work_a_2551063614_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2551063614_3212880686_p_0,(void *)work_a_2551063614_3212880686_p_1};
	xsi_register_didat("work_a_2551063614_3212880686", "isim/Sum_monitoring_tb_isim_beh.exe.sim/work/a_2551063614_3212880686.didat");
	xsi_register_executes(pe);
}
