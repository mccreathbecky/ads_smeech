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
unsigned char ieee_p_1242562249_sub_1781507893_1035706684(char *, char *, char *, int );
char *ieee_p_1242562249_sub_1808404841_1035706684(char *, char *, char *, char *, int );
char *ieee_p_1242562249_sub_1919329317_1035706684(char *, char *, char *, char *, int );
char *ieee_p_1242562249_sub_1922276087_1035706684(char *, char *, char *, char *, char *, char *);
char *ieee_p_1242562249_sub_2053728113_1035706684(char *, char *, char *, char *, char *, char *);


static void work_a_2551063614_3212880686_p_0(char *t0)
{
    char t12[16];
    char t13[16];
    char t14[16];
    char t32[16];
    char t33[16];
    char t34[16];
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
    char *t15;
    char *t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    int t25;
    int t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t35;
    char *t36;

LAB0:    xsi_set_current_line(62, ng0);
    t2 = (t0 + 992U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 5200);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(63, ng0);
    t4 = (t0 + 5296);
    t8 = (t4 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t4);
    xsi_set_current_line(66, ng0);
    t2 = (t0 + 2952U);
    t4 = *((char **)t2);
    t2 = (t0 + 9536U);
    t5 = (t0 + 1352U);
    t8 = *((char **)t5);
    t5 = (t0 + 9344U);
    t9 = (t0 + 3528U);
    t10 = *((char **)t9);
    t9 = (t0 + 9456U);
    t11 = ieee_p_1242562249_sub_2053728113_1035706684(IEEE_P_1242562249, t14, t8, t5, t10, t9);
    t15 = ieee_p_1242562249_sub_1808404841_1035706684(IEEE_P_1242562249, t13, t11, t14, 60);
    t16 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t12, t4, t2, t15, t13);
    t17 = (t12 + 12U);
    t18 = *((unsigned int *)t17);
    t19 = (1U * t18);
    t1 = (13U != t19);
    if (t1 == 1)
        goto LAB8;

LAB9:    t20 = (t0 + 5360);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t16, 13U);
    xsi_driver_first_trans_fast(t20);
    xsi_set_current_line(68, ng0);
    t2 = (t0 + 1192U);
    t4 = *((char **)t2);
    t2 = (t0 + 9658);
    t25 = xsi_mem_cmp(t2, t4, 2U);
    if (t25 == 1)
        goto LAB11;

LAB14:    t8 = (t0 + 9660);
    t26 = xsi_mem_cmp(t8, t4, 2U);
    if (t26 == 1)
        goto LAB12;

LAB15:
LAB13:    xsi_set_current_line(81, ng0);
    t2 = (t0 + 2472U);
    t4 = *((char **)t2);
    t2 = (t0 + 9488U);
    t5 = (t0 + 1352U);
    t8 = *((char **)t5);
    t5 = (t0 + 9344U);
    t9 = (t0 + 3528U);
    t10 = *((char **)t9);
    t9 = (t0 + 9456U);
    t11 = ieee_p_1242562249_sub_2053728113_1035706684(IEEE_P_1242562249, t32, t8, t5, t10, t9);
    t15 = ieee_p_1242562249_sub_1808404841_1035706684(IEEE_P_1242562249, t14, t11, t32, 60);
    t16 = ieee_p_1242562249_sub_1547270861_1035706684(IEEE_P_1242562249, t13, t4, t2, t15, t14);
    t17 = (t0 + 1512U);
    t20 = *((char **)t17);
    t17 = (t0 + 9360U);
    t21 = (t0 + 3528U);
    t22 = *((char **)t21);
    t21 = (t0 + 9456U);
    t23 = ieee_p_1242562249_sub_2053728113_1035706684(IEEE_P_1242562249, t34, t20, t17, t22, t21);
    t24 = ieee_p_1242562249_sub_1808404841_1035706684(IEEE_P_1242562249, t33, t23, t34, 60);
    t27 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t12, t16, t13, t24, t33);
    t28 = (t12 + 12U);
    t18 = *((unsigned int *)t28);
    t19 = (1U * t18);
    t1 = (11U != t19);
    if (t1 == 1)
        goto LAB23;

LAB24:    t29 = (t0 + 5424);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    t35 = (t31 + 56U);
    t36 = *((char **)t35);
    memcpy(t36, t27, 11U);
    xsi_driver_first_trans_fast(t29);
    xsi_set_current_line(82, ng0);
    t2 = (t0 + 2632U);
    t4 = *((char **)t2);
    t2 = (t0 + 9504U);
    t5 = (t0 + 1512U);
    t8 = *((char **)t5);
    t5 = (t0 + 9360U);
    t9 = (t0 + 3528U);
    t10 = *((char **)t9);
    t9 = (t0 + 9456U);
    t11 = ieee_p_1242562249_sub_2053728113_1035706684(IEEE_P_1242562249, t14, t8, t5, t10, t9);
    t15 = ieee_p_1242562249_sub_1808404841_1035706684(IEEE_P_1242562249, t13, t11, t14, 60);
    t16 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t12, t4, t2, t15, t13);
    t17 = (t12 + 12U);
    t18 = *((unsigned int *)t17);
    t19 = (1U * t18);
    t1 = (12U != t19);
    if (t1 == 1)
        goto LAB25;

LAB26:    t20 = (t0 + 5552);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t16, 12U);
    xsi_driver_first_trans_fast(t20);
    xsi_set_current_line(83, ng0);
    t2 = (t0 + 2792U);
    t4 = *((char **)t2);
    t2 = (t0 + 9520U);
    t5 = (t0 + 1512U);
    t8 = *((char **)t5);
    t5 = (t0 + 9360U);
    t9 = (t0 + 3528U);
    t10 = *((char **)t9);
    t9 = (t0 + 9456U);
    t11 = ieee_p_1242562249_sub_2053728113_1035706684(IEEE_P_1242562249, t14, t8, t5, t10, t9);
    t15 = ieee_p_1242562249_sub_1808404841_1035706684(IEEE_P_1242562249, t13, t11, t14, 60);
    t16 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t12, t4, t2, t15, t13);
    t17 = (t12 + 12U);
    t18 = *((unsigned int *)t17);
    t19 = (1U * t18);
    t1 = (13U != t19);
    if (t1 == 1)
        goto LAB27;

LAB28:    t20 = (t0 + 5488);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t16, 13U);
    xsi_driver_first_trans_fast(t20);

LAB10:    xsi_set_current_line(86, ng0);
    t2 = (t0 + 5616);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    goto LAB3;

LAB5:    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_size_not_matching(13U, t19, 0);
    goto LAB9;

LAB11:    xsi_set_current_line(71, ng0);
    t10 = (t0 + 2472U);
    t11 = *((char **)t10);
    t10 = (t0 + 9488U);
    t15 = (t0 + 1352U);
    t16 = *((char **)t15);
    t15 = (t0 + 9344U);
    t17 = (t0 + 3528U);
    t20 = *((char **)t17);
    t17 = (t0 + 9456U);
    t21 = ieee_p_1242562249_sub_2053728113_1035706684(IEEE_P_1242562249, t14, t16, t15, t20, t17);
    t22 = ieee_p_1242562249_sub_1808404841_1035706684(IEEE_P_1242562249, t13, t21, t14, 60);
    t23 = ieee_p_1242562249_sub_1547270861_1035706684(IEEE_P_1242562249, t12, t11, t10, t22, t13);
    t24 = (t12 + 12U);
    t18 = *((unsigned int *)t24);
    t19 = (1U * t18);
    t1 = (11U != t19);
    if (t1 == 1)
        goto LAB17;

LAB18:    t27 = (t0 + 5424);
    t28 = (t27 + 56U);
    t29 = *((char **)t28);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    memcpy(t31, t23, 11U);
    xsi_driver_first_trans_fast(t27);
    goto LAB10;

LAB12:    xsi_set_current_line(75, ng0);
    t2 = (t0 + 2472U);
    t4 = *((char **)t2);
    t2 = (t0 + 9488U);
    t5 = (t0 + 1352U);
    t8 = *((char **)t5);
    t5 = (t0 + 9344U);
    t9 = (t0 + 3528U);
    t10 = *((char **)t9);
    t9 = (t0 + 9456U);
    t11 = ieee_p_1242562249_sub_2053728113_1035706684(IEEE_P_1242562249, t32, t8, t5, t10, t9);
    t15 = ieee_p_1242562249_sub_1808404841_1035706684(IEEE_P_1242562249, t14, t11, t32, 60);
    t16 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t13, t4, t2, t15, t14);
    t17 = (t0 + 3648U);
    t20 = *((char **)t17);
    t17 = (t0 + 9472U);
    t21 = (t0 + 3528U);
    t22 = *((char **)t21);
    t21 = (t0 + 9456U);
    t23 = ieee_p_1242562249_sub_2053728113_1035706684(IEEE_P_1242562249, t34, t20, t17, t22, t21);
    t24 = ieee_p_1242562249_sub_1808404841_1035706684(IEEE_P_1242562249, t33, t23, t34, 60);
    t27 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t12, t16, t13, t24, t33);
    t28 = (t12 + 12U);
    t18 = *((unsigned int *)t28);
    t19 = (1U * t18);
    t1 = (11U != t19);
    if (t1 == 1)
        goto LAB19;

LAB20:    t29 = (t0 + 5424);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    t35 = (t31 + 56U);
    t36 = *((char **)t35);
    memcpy(t36, t27, 11U);
    xsi_driver_first_trans_fast(t29);
    xsi_set_current_line(76, ng0);
    t2 = (t0 + 2792U);
    t4 = *((char **)t2);
    t2 = (t0 + 9520U);
    t5 = (t0 + 3648U);
    t8 = *((char **)t5);
    t5 = (t0 + 9472U);
    t9 = (t0 + 3528U);
    t10 = *((char **)t9);
    t9 = (t0 + 9456U);
    t11 = ieee_p_1242562249_sub_2053728113_1035706684(IEEE_P_1242562249, t14, t8, t5, t10, t9);
    t15 = ieee_p_1242562249_sub_1808404841_1035706684(IEEE_P_1242562249, t13, t11, t14, 60);
    t16 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t12, t4, t2, t15, t13);
    t17 = (t12 + 12U);
    t18 = *((unsigned int *)t17);
    t19 = (1U * t18);
    t1 = (13U != t19);
    if (t1 == 1)
        goto LAB21;

LAB22:    t20 = (t0 + 5488);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t16, 13U);
    xsi_driver_first_trans_fast(t20);
    goto LAB10;

LAB16:;
LAB17:    xsi_size_not_matching(11U, t19, 0);
    goto LAB18;

LAB19:    xsi_size_not_matching(11U, t19, 0);
    goto LAB20;

LAB21:    xsi_size_not_matching(13U, t19, 0);
    goto LAB22;

LAB23:    xsi_size_not_matching(11U, t19, 0);
    goto LAB24;

LAB25:    xsi_size_not_matching(12U, t19, 0);
    goto LAB26;

LAB27:    xsi_size_not_matching(13U, t19, 0);
    goto LAB28;

}

static void work_a_2551063614_3212880686_p_1(char *t0)
{
    char t11[16];
    char t12[16];
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
    char *t13;
    char *t14;

LAB0:    xsi_set_current_line(95, ng0);
    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t1 = (t0 + 9520U);
    t3 = ieee_p_1242562249_sub_1781507893_1035706684(IEEE_P_1242562249, t2, t1, 0);
    if (t3 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(98, ng0);
    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t1 = (t0 + 9504U);
    t4 = (t0 + 2792U);
    t5 = *((char **)t4);
    t4 = (t0 + 9520U);
    t6 = ieee_p_1242562249_sub_1922276087_1035706684(IEEE_P_1242562249, t12, t2, t1, t5, t4);
    t7 = ieee_p_1242562249_sub_1919329317_1035706684(IEEE_P_1242562249, t11, t6, t12, 100);
    t8 = (t0 + 5680);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t13 = (t10 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t7, 10U);
    xsi_driver_first_trans_fast_port(t8);

LAB3:    xsi_set_current_line(101, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t1 = (t0 + 9488U);
    t4 = (t0 + 3408U);
    t5 = *((char **)t4);
    t4 = (t0 + 9440U);
    t6 = ieee_p_1242562249_sub_1922276087_1035706684(IEEE_P_1242562249, t12, t2, t1, t5, t4);
    t7 = ieee_p_1242562249_sub_1919329317_1035706684(IEEE_P_1242562249, t11, t6, t12, 100);
    t8 = (t0 + 5744);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t13 = (t10 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t7, 10U);
    xsi_driver_first_trans_fast_port(t8);
    xsi_set_current_line(102, ng0);
    t1 = (t0 + 2952U);
    t2 = *((char **)t1);
    t1 = (t0 + 5808);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 13U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(103, ng0);
    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t1 = (t0 + 5872);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 13U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(105, ng0);
    t1 = (t0 + 5936);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(106, ng0);
    t1 = (t0 + 6000);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    t1 = (t0 + 5216);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(96, ng0);
    t4 = (t0 + 9662);
    t6 = (t0 + 5680);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t4, 10U);
    xsi_driver_first_trans_fast_port(t6);
    goto LAB3;

}


extern void work_a_2551063614_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2551063614_3212880686_p_0,(void *)work_a_2551063614_3212880686_p_1};
	xsi_register_didat("work_a_2551063614_3212880686", "isim/sum_tb_isim_beh.exe.sim/work/a_2551063614_3212880686.didat");
	xsi_register_executes(pe);
}
