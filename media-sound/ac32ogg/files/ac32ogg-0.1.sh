#!/bin/bash 

bitrate=64
mode="ac3"

if [ "$(basename $0)" == "vob2ogg" ]; then
    mode="vob"
elif [ "$(basename $0)" == "ac32ogg" ]; then
    echo "!!! wrong script name"
    echo "!!! \"ac32ogg\" or \"vob2ogg\" expected"
    exit 1
fi
    

if [ "$1" == "-b" -o "$1" == "--bitrate" ]
then 
    bitrate=$2
    shift 2
fi

if [ "$1" == "-h" -o "$1" == "--help" ]
then
    if [ "$mode" == "ac3" ]; then
        echo "Convert and normalize files from AC3 to Ogg-Vorbis"
	echo ""
        echo "$(basename $0)   -h|--help"
        echo "$(basename $0)   [-b #|--bitrate #] input.ac3 [...]"
    elif [ "$mode" == "vob" ]; then
        echo "Convert and normalize a set of VOB-Files to Ogg-Vorbis"
	echo ""
        echo "$(basename $0)   -h|--help"
        echo "$(basename $0)   [-b #|--bitrate #] -i vobs-dir -a audiotrack out.ogg"
    fi

    echo ""
    echo "Default birate is $bitrate."
    echo ""
    echo "(c) 2003 written by Tobias Roeser"
    exit 0
fi

echo ">>> Convert to Ogg-Vorbis using bitrate: $bitrate"

if [ "$1" == "" ]
then
    echo "*** No input file given"
    echo "    Try $(basename $0) --help or $(basename $0) -h for more help"
    exit 1
fi


if [ "$mode" == "ac3" ]; then

    while [ "$1" != "" ] 
    do
	inputFile="$1"
        outputFile="$inputFile.ogg"

	if [ -f "$outputFile" ]
        then
	    echo " * Replace existing file $outputFile?"
	    rm -i "$outputFile"
	    if [ -f "$outputFile" ] 
    	    then 
		echo ">>> skipping $inputFile"
		shift
		continue
	    fi
	fi

	echo ">>> Encoding $inputFile..."

	transcode -i "$inputFile" \
	    -x null,ac3 \
	    -a 0  \
	    -N 0xfffe \
	    -J resample,normalize \
	    -E 44100,16,2 \
	    -b $bitrate \
	    -y null,ogg \
	    -o "$outputFile"
	
	if [ "$?" == 0 ] 
	then
	    echo ">>> Saved to $outputFile"
	else
	    echo "!!! Error ($inputFile --> $outputFile)"
	    exit 1
	fi
    
	shift
    done

elif [ "$mode" == "vob" ]; then

    vobDir=""
    audiotrack=""

    while [ "$1" == "-i" -o "$1" == "-a" ]; do
	if [ "$1" == "-i" ]; then
	    vobDir="$2"
	    shift 2
	elif [ "$1" == "-a" ]; then
	    audiotrack="$2"
	    shift 2
	fi
    done

    if [ "$1" == ""  ]; then
	echo "!!! Error: missing filename for output"
	exit 1
    elif [ "$vobDir" == "" ]; then
	echo "!!! Error: missing vobs-dir"
	exit 1
    elif [ "$audiotrack" == "" ]; then
	echo "!!! Error: missing audiotrack number"
	exit 1
    fi

    outputFile="$1"
    
    if [ -f "$outputFile" ]; then
        echo " * Replace existing file $outputFile?"
        rm -i "$outputFile"
	if [ -f "$outputFile" ]; then 
	    echo ">>> skipping $outputFile"
	    shift
	    exit 1
	fi
    fi

    echo ">>> Encoding $vobDir..."

    transcode -i "$vobDir" \
	    -x null,vob \
	    -a $audiotrack  \
	    -N 0xfffe \
	    -J resample,normalize \
	    -E 44100,16,2 \
	    -b $bitrate \
	    -y null,ogg \
	    -o "$outputFile"
	
    if [ "$?" == 0 ]; then
        echo ">>> Saved to $outputFile"
    else
        echo "!!! Error ($inputFile --> $outputFile)"
        exit 1
    fi

fi
