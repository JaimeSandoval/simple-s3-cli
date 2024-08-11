# echo "# this file is located in 'src/bucket_list_command.sh'"
# echo "# code for 's3-cli bucket list' goes here"
# echo "# you can edit it freely and regenerate (it will not be overwritten)"
# inspect_args

BUCKET_NAME=${args[bucket]}
EMPTY=""

if [[ -z "$BUCKET_NAME" && -z "${!S3_BUCKET_NAME}" ]]; then
  echo "Error: A Bucket Name was not passed in and the environment variable S3_BUCKET_NAME is empty or unset."
  echo "Pass in a Bucket Name or use the choose command before running"
  exit 1
fi

case "$BUCKET_NAME" in
  $EMPTY)
  BUCKET_PATH="s3://$S3_BUCKET_NAME"
  ;;
  *)
    BUCKET_PATH="s3://$BUCKET_NAME"
    ;;
esac

echo
printf "Listing Files in Bucket $BUCKET_PATH"
echo

aws s3 ls $BUCKET_PATH
