# echo "# this file is located in 'src/choose_command.sh'"
# echo "# code for 's3-cli choose' goes here"
# echo "# you can edit it freely and regenerate (it will not be overwritten)"

export S3_BUCKET_NAME=${args[bucket]}

echo "Run the command:"
echo
echo "'export S3_BUCKET_NAME=$S3_BUCKET_NAME'"
echo