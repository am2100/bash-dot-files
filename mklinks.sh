#! /bin/bash

# Clone bash-dot-files repo into your home directory
# Run `mklinks.sh` to create softlinks from `~/` to
# version controlled dot files.
#
# Any existing dot-files in the `~/` directory will
# be backed up

REPO=~/bash-dot-files/.*

echo "Creating links..."

for FILE in $REPO
do
	if [ -f "$FILE" ] && [ ! $(basename $FILE) == '.git' ]
	then
		# name=$(basename $FILE)
		# echo "$FILE"
		# echo $name

		ln --symbolic --backup $FILE ~/
		echo "$(basename $FILE) -> $FILE"
	fi
done
