# echo "# this file is located in 'src/list_command.sh'"
# echo "# code for 's3-cli list' goes here"
# echo "# you can edit it freely and regenerate (it will not be overwritten)"

printf "Listing AWS Account Buckets:"
echo

aws s3 ls
