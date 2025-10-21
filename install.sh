#!/bin/ash

set -e

SCRIPT_DIR=$(readlink -f $(dirname ${0}))
KLIPPER_DIR=/usr/share/klipper
PRINTER_DATA_DIR=/mnt/UDISK/printer_data

ln -sf ${SCRIPT_DIR}/screws_tilt_adjust.py \
    ${KLIPPER_DIR}/klippy/extras/screws_tilt_adjust.py

test -d ${PRINTER_DATA_DIR}/config/custom || mkdir -p ${PRINTER_DATA_DIR}/config/custom

ln -sf ${SCRIPT_DIR}/screws_tilt_adjust.cfg \
    ${PRINTER_DATA_DIR}/config/custom/screws_tilt_adjust.cfg

python ${SCRIPT_DIR}/ensure_included.py \
    ${PRINTER_DATA_DIR}/config/custom/main.cfg \
    screws_tilt_adjust.cfg

/etc/init.d/klipper restart