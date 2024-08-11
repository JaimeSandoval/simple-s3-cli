# echo "# this file is located in 'src/pull_command.sh'"
# echo "# code for 's3-cli pull' goes here"
# echo "# you can edit it freely and regenerate (it will not be overwritten)"
# inspect_args

get_auth

LOCAL_PATH=${args[target_path]:-$(pwd)} #Default to `pwd` if not provided
SOURCE_PATH=${args[source_path]}
EMPTY=""

case "$SOURCE_PATH" in
  $EMPTY)
  echo "S3 File was not provided! Please provide the file and it's path in the S3 Bucket."
  exit 1
  ;;
  *"$SOURCE_PATH"*)
    BUCKET_PATH=$SOURCE_PATH
    ;;
  *)
    BUCKET_PATH="s3://$S3_BUCKET_NAME/$SOURCE_PATH"
    ;;
esac

echo
printf "Copying File '$BUCKET_PATH' to '$LOCAL_PATH'"
echo

aws s3 mv $BUCKET_PATH $LOCAL_PATH
