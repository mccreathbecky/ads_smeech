# ads_smeech

## Context
This is a UTS project for ADS, Advanced Digital Systems, modelled off a similar project in ICT D called 'SMEECH'.

It was completed by Becky McCreath and William Chpargala in Term 2, 2016.

## Project Overview
This project simulates an efficient energy management system in which a 'Master Energy Unit Controller' is connected to both batteries fed by solar power, and mains power, and must determine which energy source to use to maintain the battery levels and reliably meet user demands.

Various hard coded inputs are provided [available solar power, demand for power] based on researched government statistics around average household usage.

The hardware on which the code ran was specified by the UTS assignment guide.

## Project Aim
The system is an efficient energy management system which is designed to automatically select the best energy input for the batteries, based on the renewable energy input and the current battery levels.

The goal of this system is to ensure a user has a reliable and renewable source of energy for their home.

## Project Need
With a growing implementation of solar power in the home, yet also of devices and power needs, there is a need to balance renewable energy with reliability and maintenance of batteries to ensure longevity.

## User Interfaces
The system will display the following data to the user using the seven segment display and LEDs on the FPGA:
1) The current battery level as a percentage
2) The total amount of power generated for the day in Wh, with solar as a percentage
3) The total amount of power consumed for the day in Wh
4) The current input source using LEDs

The user will be able to:
1) Override the automatic switching and select which input source to use

