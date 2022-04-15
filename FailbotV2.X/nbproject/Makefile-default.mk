#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/FailbotV2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/FailbotV2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS
SUB_IMAGE_ADDRESS_COMMAND=--image-address $(SUB_IMAGE_ADDRESS)
else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=ADC.c ChipConfig.c IO.c PWM.c Robot.c Toolbox.c main.c timer.c UART.c CB_TX1.c CB_RX1.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/ADC.o ${OBJECTDIR}/ChipConfig.o ${OBJECTDIR}/IO.o ${OBJECTDIR}/PWM.o ${OBJECTDIR}/Robot.o ${OBJECTDIR}/Toolbox.o ${OBJECTDIR}/main.o ${OBJECTDIR}/timer.o ${OBJECTDIR}/UART.o ${OBJECTDIR}/CB_TX1.o ${OBJECTDIR}/CB_RX1.o
POSSIBLE_DEPFILES=${OBJECTDIR}/ADC.o.d ${OBJECTDIR}/ChipConfig.o.d ${OBJECTDIR}/IO.o.d ${OBJECTDIR}/PWM.o.d ${OBJECTDIR}/Robot.o.d ${OBJECTDIR}/Toolbox.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/timer.o.d ${OBJECTDIR}/UART.o.d ${OBJECTDIR}/CB_TX1.o.d ${OBJECTDIR}/CB_RX1.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/ADC.o ${OBJECTDIR}/ChipConfig.o ${OBJECTDIR}/IO.o ${OBJECTDIR}/PWM.o ${OBJECTDIR}/Robot.o ${OBJECTDIR}/Toolbox.o ${OBJECTDIR}/main.o ${OBJECTDIR}/timer.o ${OBJECTDIR}/UART.o ${OBJECTDIR}/CB_TX1.o ${OBJECTDIR}/CB_RX1.o

# Source Files
SOURCEFILES=ADC.c ChipConfig.c IO.c PWM.c Robot.c Toolbox.c main.c timer.c UART.c CB_TX1.c CB_RX1.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/FailbotV2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=33EP512GM306
MP_LINKER_FILE_OPTION=,--script=p33EP512GM306.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/ADC.o: ADC.c  .generated_files/flags/default/fc541f2209c795febe6631b69854b23e6e4dd8b0 .generated_files/flags/default/d0069a406b199ddf13f961b25b13067240c1ddd8
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ADC.o.d 
	@${RM} ${OBJECTDIR}/ADC.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ADC.c  -o ${OBJECTDIR}/ADC.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/ADC.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/ChipConfig.o: ChipConfig.c  .generated_files/flags/default/720e6dfb75c4cc9e40b27a5d804c8a7899f883ab .generated_files/flags/default/d0069a406b199ddf13f961b25b13067240c1ddd8
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ChipConfig.o.d 
	@${RM} ${OBJECTDIR}/ChipConfig.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ChipConfig.c  -o ${OBJECTDIR}/ChipConfig.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/ChipConfig.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/IO.o: IO.c  .generated_files/flags/default/4e3ece070089dd14bd571ed9e56cfee6bee8845b .generated_files/flags/default/d0069a406b199ddf13f961b25b13067240c1ddd8
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/IO.o.d 
	@${RM} ${OBJECTDIR}/IO.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  IO.c  -o ${OBJECTDIR}/IO.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/IO.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/PWM.o: PWM.c  .generated_files/flags/default/74749ab7499bd67da8572342f55f18c994d0d96e .generated_files/flags/default/d0069a406b199ddf13f961b25b13067240c1ddd8
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/PWM.o.d 
	@${RM} ${OBJECTDIR}/PWM.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  PWM.c  -o ${OBJECTDIR}/PWM.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/PWM.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/Robot.o: Robot.c  .generated_files/flags/default/fdb9f3d8f799a6a41f5496c578b57a17c23107cb .generated_files/flags/default/d0069a406b199ddf13f961b25b13067240c1ddd8
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Robot.o.d 
	@${RM} ${OBJECTDIR}/Robot.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Robot.c  -o ${OBJECTDIR}/Robot.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/Robot.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/Toolbox.o: Toolbox.c  .generated_files/flags/default/fd88dd61965f268fb217de5cc12c08b202dc793a .generated_files/flags/default/d0069a406b199ddf13f961b25b13067240c1ddd8
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Toolbox.o.d 
	@${RM} ${OBJECTDIR}/Toolbox.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Toolbox.c  -o ${OBJECTDIR}/Toolbox.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/Toolbox.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/833e8c42227792eaa0684c659a78518e5b3c27bf .generated_files/flags/default/d0069a406b199ddf13f961b25b13067240c1ddd8
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/timer.o: timer.c  .generated_files/flags/default/433d7d58d6dad330b23c95ab5b418acc9cf53ab7 .generated_files/flags/default/d0069a406b199ddf13f961b25b13067240c1ddd8
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/timer.o.d 
	@${RM} ${OBJECTDIR}/timer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  timer.c  -o ${OBJECTDIR}/timer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/timer.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/UART.o: UART.c  .generated_files/flags/default/f8c6469ea52832010f658ae410f589ff81d29308 .generated_files/flags/default/d0069a406b199ddf13f961b25b13067240c1ddd8
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UART.o.d 
	@${RM} ${OBJECTDIR}/UART.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  UART.c  -o ${OBJECTDIR}/UART.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/UART.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/CB_TX1.o: CB_TX1.c  .generated_files/flags/default/7b1135dab40a752be497456aabbfd2a818801d1f .generated_files/flags/default/d0069a406b199ddf13f961b25b13067240c1ddd8
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/CB_TX1.o.d 
	@${RM} ${OBJECTDIR}/CB_TX1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  CB_TX1.c  -o ${OBJECTDIR}/CB_TX1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/CB_TX1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/CB_RX1.o: CB_RX1.c  .generated_files/flags/default/556c5c56ce0a8e36319976bcb25c8a4fc4779e64 .generated_files/flags/default/d0069a406b199ddf13f961b25b13067240c1ddd8
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/CB_RX1.o.d 
	@${RM} ${OBJECTDIR}/CB_RX1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  CB_RX1.c  -o ${OBJECTDIR}/CB_RX1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/CB_RX1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/ADC.o: ADC.c  .generated_files/flags/default/cd90a0b2bda95d89ff56c49e8174127a1f4ba7bf .generated_files/flags/default/d0069a406b199ddf13f961b25b13067240c1ddd8
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ADC.o.d 
	@${RM} ${OBJECTDIR}/ADC.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ADC.c  -o ${OBJECTDIR}/ADC.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/ADC.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/ChipConfig.o: ChipConfig.c  .generated_files/flags/default/b30c9dbfda8f08bd557c956a096ab84b7918fa75 .generated_files/flags/default/d0069a406b199ddf13f961b25b13067240c1ddd8
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ChipConfig.o.d 
	@${RM} ${OBJECTDIR}/ChipConfig.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ChipConfig.c  -o ${OBJECTDIR}/ChipConfig.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/ChipConfig.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/IO.o: IO.c  .generated_files/flags/default/ae3db735ea7f6ca237ebda6a4cab429d22e7011 .generated_files/flags/default/d0069a406b199ddf13f961b25b13067240c1ddd8
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/IO.o.d 
	@${RM} ${OBJECTDIR}/IO.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  IO.c  -o ${OBJECTDIR}/IO.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/IO.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/PWM.o: PWM.c  .generated_files/flags/default/3fa388adae8e611f8b1984a22f27f03a2b1e4659 .generated_files/flags/default/d0069a406b199ddf13f961b25b13067240c1ddd8
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/PWM.o.d 
	@${RM} ${OBJECTDIR}/PWM.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  PWM.c  -o ${OBJECTDIR}/PWM.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/PWM.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/Robot.o: Robot.c  .generated_files/flags/default/ef2a1172c81ece2f0189bffea6b2a6f998a31404 .generated_files/flags/default/d0069a406b199ddf13f961b25b13067240c1ddd8
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Robot.o.d 
	@${RM} ${OBJECTDIR}/Robot.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Robot.c  -o ${OBJECTDIR}/Robot.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/Robot.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/Toolbox.o: Toolbox.c  .generated_files/flags/default/553496ad528b51280d4942ae7a36ebd44c809d81 .generated_files/flags/default/d0069a406b199ddf13f961b25b13067240c1ddd8
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Toolbox.o.d 
	@${RM} ${OBJECTDIR}/Toolbox.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Toolbox.c  -o ${OBJECTDIR}/Toolbox.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/Toolbox.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/42498a70ab91bde68ce0007dd3a27c2c28e97d4b .generated_files/flags/default/d0069a406b199ddf13f961b25b13067240c1ddd8
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/timer.o: timer.c  .generated_files/flags/default/98e32c453b2ec8bcc049db75f7763884e907834a .generated_files/flags/default/d0069a406b199ddf13f961b25b13067240c1ddd8
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/timer.o.d 
	@${RM} ${OBJECTDIR}/timer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  timer.c  -o ${OBJECTDIR}/timer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/timer.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/UART.o: UART.c  .generated_files/flags/default/c4cf66e3ed4ccb6d5c03ff0ee8d3dd943e7443c3 .generated_files/flags/default/d0069a406b199ddf13f961b25b13067240c1ddd8
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UART.o.d 
	@${RM} ${OBJECTDIR}/UART.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  UART.c  -o ${OBJECTDIR}/UART.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/UART.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/CB_TX1.o: CB_TX1.c  .generated_files/flags/default/6caebcc9c48727e1355fae46952f16c8859008f .generated_files/flags/default/d0069a406b199ddf13f961b25b13067240c1ddd8
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/CB_TX1.o.d 
	@${RM} ${OBJECTDIR}/CB_TX1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  CB_TX1.c  -o ${OBJECTDIR}/CB_TX1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/CB_TX1.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/CB_RX1.o: CB_RX1.c  .generated_files/flags/default/b4c3b2ebc09721bea5c99e6323bb7520c11bcc63 .generated_files/flags/default/d0069a406b199ddf13f961b25b13067240c1ddd8
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/CB_RX1.o.d 
	@${RM} ${OBJECTDIR}/CB_RX1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  CB_RX1.c  -o ${OBJECTDIR}/CB_RX1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/CB_RX1.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/FailbotV2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/FailbotV2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x1000:0x101B -mreserve=data@0x101C:0x101D -mreserve=data@0x101E:0x101F -mreserve=data@0x1020:0x1021 -mreserve=data@0x1022:0x1023 -mreserve=data@0x1024:0x1027 -mreserve=data@0x1028:0x104F   -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,--defsym=__MPLAB_DEBUGGER_ICD3=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/FailbotV2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/FailbotV2.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}\\xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/FailbotV2.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
