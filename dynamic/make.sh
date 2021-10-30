#!/bin/bash
############################################################
# Help                                                     #
############################################################
Help()
{
   # Display Help
   echo "Cloudformation script generation"
   echo ""
   echo "Syntax: make.sh  [-c|h|e]"
   echo "options:"
   echo "c     CIDR block network part.. Example 10.30"
   echo "e     Environment short code. Example dev3"
   echo "h     Help page"
   echo
}

############################################################
############################################################
# Main program                                             #
############################################################
############################################################

# Set variables

############################################################
# Process the input options. Add options as needed.        #
############################################################
# Get the options
while getopts ":hc:e:" option; do
   case $option in
      h) # display Help
         Help
         exit;;
      c) #echo "got cidr"
         cidr=$OPTARG;;
      e) #echo "got env"
         envname=$OPTARG;;
     \?) # Invalid option
         echo "Error: Invalid option"
         exit;;
   esac
done

if [ -z "$cidr" ] 
then 
  echo "CIDR block needs to be provided"
  Help
  exit
fi

if [ -z "$envname" ]
then 
  echo "Environment name needs to be provided"
  Help
  exit
fi

echo ""
echo "Processing scripts for $envname with CIDR block $cidr"
echo ""

if [ -d "$envname" ]; then
  # Take action if $DIR exists. #
  echo "Directory ${DIR} already exists. Remove the directory and rerun the process"
  echo ""
  exit
fi

mkdir $envname
echo "Directory $envname created"

for file in master/*.yaml

do
  file=`echo $file | cut -f2 -d"/"`
  echo "processing $file"
  sed "s/varenvname/$envname/g" master/$file | sed "s/10.20/$cidr/g" > $envname/$file
done

echo "Done"



