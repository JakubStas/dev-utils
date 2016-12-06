#!/usr/bin/env bash

programName=$0

function usage {
    echo "Converts a .dat file into a valid json format and stores it in a file."
    echo ""
    echo "Usage: $programName -if=filePath -of=filePath"
    echo "	-if                 read from .dat file"
    echo "	-of                 write to file"
    echo "	--help              display this help and exit"
}

function checkMandatoryArguments() {
    if [ -z "$INPUT_FILE" ]; then
        echo "Mandatory argument -if is missing!\n"
        usage
        exit 1
    fi

    if [ -z "$OUTPUT_FILE" ]; then
        echo "Mandatory argument -of is missing!\n"
        usage
        exit 1
    fi
}

function convertToJson() {
    cat ${INPUT_FILE} | sed -e 's/$/}/' -e $'s/\x02/,"/g' -e $'s/\x03/":/g' -e 's/^/{"/' > ${OUTPUT_FILE}
}

for i in "$@"
    do
        case ${i} in
            -of=*)
                OUTPUT_FILE="${i#*=}"
                shift
                ;;
            -if=*)
                INPUT_FILE="${i#*=}"
                shift
                ;;
            -h|--help)
                usage
                exit 0
                ;;
            *)
                # unknown option
                echo "$programName: unrecognized option '$i'"
                echo "Try '$programName --help' for more information."
                exit 1
            ;;
esac
done

checkMandatoryArguments
convertToJson