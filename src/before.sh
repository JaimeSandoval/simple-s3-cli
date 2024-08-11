## before hook
##
## Any code here will be placed inside a `before_hook()` function and called
## before running any command (but after processing its arguments).
##
## You can safely delete this file if you do not need it.
# echo "==[ Before Hook Called ]=="


# Check if the credentials file exists
if [ -f "$CREDENTIALS_FILE" ]; then
  # Source the credentials file
  source $CREDENTIALS_FILE
else
  echo
  echo "Credentials are not Set. Run:"
  echo
  echo "'s3-cli auth'"
  exit 1
fi

# Check if the credentials are valid
if ! aws sts get-caller-identity > /dev/null 2>&1; then
  echo "AWS credentials are invalid or expired. Run:"
  echo
  echo "'s3-cli auth'"
fi
