#!/usr/bin/env bash
set -e # exit on error

# author: schapm
# github.com/schapm/ffmpeg_batch_convert

declare working_dir="$(pwd)"
declare output_dir="${working_dir}/output" # default dir

declare source_media_ext
declare target_media_ext

func::convert() {
    for dir in "${working_dir}"/*; do
        local dir_base_name=$(echo "${dir}" | cut -d'/' -f6-)

        mkdir -p "${output_dir}/${dir_base_name}"

        for file in "${dir}"/*${source_media_ext}; do
            dir_base_path="${file%.}"
            dir_base_name=$(echo "${file%.}" | cut -d'/' -f6-)

            ffmpeg -i "${file}" "${output_dir}/${dir_base_name}${target_media_ext}"
        done
    done

    echo -e "Finished"
}

func::show_help() {
    echo -e "Usage: e.g. `basename "$0"` -i|--input-extension \"mp4\" -o|--output-extension \"mp3\" [OPTIONAL] -n|--input-dir \"$HOME\""
    exit 1
}

###############################################################################
####################################[ MAIN ]###################################
###############################################################################

if [[ "$#" -eq 0 ]]; then
    func::show_help
fi

while [[ -n "$1" ]] ; do
    case "$1" in
        --help|-h)
            func::show_help
            exit 0
        ;;
        --input-extension|-i)
              shift 1
            source_media_ext=".${1}"
        ;;
        --output-extension|-o)
            shift 1
            target_media_ext=".${1}"
        ;;
        --input-dir|-n)
            shift 1
            working_dir=${1}
            output_dir="${working_dir}/output"
        ;;
        *)
            shift 1
            func::show_help
            break
    esac
    
    shift 1
done

func::convert

# EOF