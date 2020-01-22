#      ____
#     / __/_  ______  __________
#    / /_/ / / / __ \/ ___/ ___/
# _ / __/ /_/ / / / / /__(__  )
#(_)_/  \__,_/_/ /_/\___/____/

function cdd() {
    font="System San Francisco Display"
    root_dev_folder=~/dev
    dev_folder_name=`ls -1 "${root_dev_folder}" | dmenu -fn "${font}" -i -p "Choose dev folder:"`

    if [[ ${dev_folder_name} ]]; then
        dev_folder=${root_dev_folder}/${dev_folder_name}

    projects_count=`ls -1 "${dev_folder}" | wc -l`
    project_name=`ls -1 "${dev_folder}" | dmenu -fn "${font}" -i -p "${dev_folder_name}" -l \
        "${projects_count}"`

    [ ${project_name} ] && cd ${dev_folder}/${project_name}
    fi
}
