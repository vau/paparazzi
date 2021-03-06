# Hey Emacs, this is a -*- makefile -*-

# attitude estimation for fixedwings via dcm algorithm


ifeq ($(TARGET), ap)

ap.CFLAGS += -DAHRS_TYPE_H=\"subsystems/ahrs/ahrs_float_dcm.h\"
ap.CFLAGS += -DUSE_AHRS_ALIGNER
ap.CFLAGS += -DUSE_AHRS

ap.srcs   += $(SRC_SUBSYSTEMS)/ahrs.c
ap.srcs   += $(SRC_SUBSYSTEMS)/ahrs/ahrs_aligner.c
ap.srcs   += $(SRC_SUBSYSTEMS)/ahrs/ahrs_float_dcm.c

ifdef AHRS_ALIGNER_LED
  ap.CFLAGS += -DAHRS_ALIGNER_LED=$(AHRS_ALIGNER_LED)
endif

ifdef CPU_LED
  ap.CFLAGS += -DAHRS_CPU_LED=$(CPU_LED)
endif

ifdef AHRS_PROPAGATE_FREQUENCY
else
  AHRS_PROPAGATE_FREQUENCY = 60
endif

ifdef AHRS_CORRECT_FREQUENCY
else
  AHRS_CORRECT_FREQUENCY = 60
endif

ap.CFLAGS += -DAHRS_PROPAGATE_FREQUENCY=$(AHRS_PROPAGATE_FREQUENCY)
ap.CFLAGS += -DAHRS_CORRECT_FREQUENCY=$(AHRS_CORRECT_FREQUENCY)

endif


ifeq ($(TARGET), sim)

sim.CFLAGS += -DAHRS_TYPE_H=\"subsystems/ahrs/ahrs_sim.h\"
sim.CFLAGS += -DUSE_AHRS -DAHRS_UPDATE_FW_ESTIMATOR

sim.srcs   += $(SRC_SUBSYSTEMS)/ahrs.c
sim.srcs   += $(SRC_SUBSYSTEMS)/ahrs/ahrs_sim.c

endif

