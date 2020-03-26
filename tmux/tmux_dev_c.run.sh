#!/bin/sh

while getopts "p:" opt; do
    case $opt in
        p) PRJ_DIR="${OPTARG}";;
        *) echo "No reasonable options found";;
    esac
done

if [[ -z "${PRJ_DIR}" ]]; then
    read -p "Project directory: " -i "~/" -e PRJ_DIR
fi

if [[ -z "${PRJ_DIR}" ]]; then
    echo "Project directory is not specified"
    exit 1
fi

PRJ_DIR=$(eval echo "${PRJ_DIR}")
SRC_DIR=${PRJ_DIR}/src
INC_DIR=${SRC_DIR}/include
RES_DIR=${SRC_DIR}/resources
OUT_DIR=${PRJ_DIR}/out
CFG_DIR=${PRJ_DIR}/.project

PRJ_NAME=$(basename -- "${PRJ_DIR}")
PRJ_INIT_FILE="${CFG_DIR}/.initrc"

# Create project directory if needed
[[ ! -d "${PRJ_DIR}" ]] && mkdir "${PRJ_DIR}"

# Create project config directory if needed
[[ ! -d "${CFG_DIR}" ]] && mkdir "${CFG_DIR}"

# Create a project init file if it doen't exist
if [[ ! -f "${PRJ_INIT_FILE}" ]]; then
    cp ${DOT_FILES_VIM_C_DEV}/initrc ${PRJ_INIT_FILE}

    read -p "Source code directory(default: src): " -e SOURCE_NAME &&\
        [[ "${SOURCE_NAME}"  ]] && SRC_DIR=${PRJ_DIR}/${SOURCE_NAME}
    [[ ! -d ${SRC_DIR} ]] && mkdir ${SRC_DIR}

    read -p "Include directory(default: include): " -e INCLUDE_NAME &&\
        [[ "${INCLUDE_NAME}" ]] && INC_DIR=${SRC_DIR}/${INCLUDE_NAME}
    [[ ! -d ${INC_DIR} ]] && mkdir ${INC_DIR}

    read -p "Resource directory(default: resources): " -e RESOURCE_NAME &&\
        [[ "${RESOURCE_NAME}" ]] && RES_DIR=${SRC_DIR}/${RESOURCE_NAME}
    [[ ! -d ${RES_DIR} ]] && mkdir ${RES_DIR}

    echo "export PRJ_NAME=\"${PRJ_NAME}\"" >> ${PRJ_INIT_FILE}
    echo "export PRJ_DIR=\"${PRJ_DIR}\"" >> ${PRJ_INIT_FILE}
    echo "export SRC_DIR=\"${SRC_DIR}\"" >> ${PRJ_INIT_FILE}
    echo "export INC_DIR=\"${INC_DIR}\"" >> ${PRJ_INIT_FILE}
    echo "export RES_DIR=\"${RES_DIR}\"" >> ${PRJ_INIT_FILE}
    echo "export OUT_DIR=\"${OUT_DIR}\"" >> ${PRJ_INIT_FILE}
    echo "export CFG_DIR=\"${CFG_DIR}\"" >> ${PRJ_INIT_FILE}
    echo "export CMP=\"g++\"" >> ${PRJ_INIT_FILE}
    echo "export CFLAGS=\"-g\"" >> ${PRJ_INIT_FILE}
    echo "export IFLAGS=\"-I${INC_DIR}\"" >> ${PRJ_INIT_FILE}
    echo "export LFLAGS=\"\"" >> ${PRJ_INIT_FILE}
fi

# Echoing common parameters
echo "project name: ${PRJ_NAME}"
echo "project directory: ${PRJ_DIR}"
echo "source directory name: ${SRC_DIR}"
echo "include directory name: ${INC_DIR}"
echo "resources directory name: ${RES_DIR}"
echo "output directory name: ${OUT_DIR}"
echo "configuration directory name: ${CFG_DIR}"
echo "vim dot directory for c dev: ${DOT_FILES_VIM_C_DEV}"

# Create project specific dotfiles if needed
l_vimrc="${CFG_DIR}/.vimrc"
l_ycm_conf="${CFG_DIR}/ycm_extra_conf.py"
l_header_template="${CFG_DIR}/header.txt"
dot_vimrc="${DOT_FILES_VIM_C_DEV}/vimrc_c_dev"
dot_ycm_conf="${DOT_FILES_VIM_C_DEV}/ycm_extra_conf_c_dev.py"
dot_header_template="${DOT_FILES_VIM_C_DEV}/header_template.txt"

[[ ! -f "${l_vimrc}" ]] && cp "${dot_vimrc}" "${l_vimrc}"
[[ ! -f "${l_ycm_conf}" ]] && cp "${dot_ycm_conf}" "${l_ycm_conf}"
[[ ! -f "${l_header_template}" ]] && cp "${dot_header_template}" "${l_header_template}"

SESSION="dev-c-$(uuidgen)"
IDE_WND_NAME="ide"
RUN_WND="run"
DEBUG_WND_NAME="debug"
tmux_dev_c_conf="${DOT_FILES_TMUX}/.tmux_dev_c.conf"
tmux source "${tmux_dev_c_conf}" \; new-session -d -s "${SESSION}" -n "${IDE_WND_NAME}"

tmux send-keys -t "${SESSION}" "cd ${PRJ_DIR}" Enter
tmux send-keys -t "${SESSION}" "source ${PRJ_INIT_FILE}" Enter
tmux send-keys -t "${SESSION}" "clear" Enter
tmux send-keys -t "${SESSION}" "vi -u ${l_vimrc} ${PRJ_DIR}" Enter

tmux new-window -t "${SESSION}" -n "${RUN_WND}"
tmux send-keys -t "${SESSION}" "cd ${PRJ_DIR}" Enter
tmux send-keys -t "${SESSION}" "source ${PRJ_INIT_FILE}" Enter
tmux send-keys -t "${SESSION}" "clear" Enter

tmux new-window -t "${SESSION}" -n "${DEBUG_WND_NAME}"
tmux send-keys -t "${SESSION}" "cd ${PRJ_DIR}" Enter
tmux send-keys -t "${SESSION}" "source ${PRJ_INIT_FILE}" Enter
tmux send-keys -t "${SESSION}" "clear" Enter

tmux select-window -t 1

tmux attach-session -t "${SESSION}"
