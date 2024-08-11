# echo "# this file is located in 'src/push_command.sh'"
# echo "# code for 's3-cli push' goes here"
# echo "# you can edit it freely and regenerate (it will not be overwritten)"

TARGET_PATH=${args[target_path]}
LOCAL_PATH=${args[source_path]}
EMPTY=""

case "$TARGET_PATH" in
  $EMPTY)
  BUCKET_PATH=$S3_BUCKET_NAME
  ;;
  *"$TARGET_PATH"*)
    BUCKET_PATH=$TARGET_PATH
    ;;
  *)
    BUCKET_PATH="s3://$S3_BUCKET_NAME/$TARGET_PATH"
    ;;
esac

echo
printf "Pushing File to $BUCKET_PATH"
echo

aws s3 mv $LOCAL_PATH $BUCKET_PATH
