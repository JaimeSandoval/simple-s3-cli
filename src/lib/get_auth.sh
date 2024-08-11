get_auth () {
  if [ -f "$CREDENTIALS_FILE" ]; then
    # Source the credentials file
    source $CREDENTIALS_FILE
  else
    echo
    printf "Credentials are not Set. Run:\n"
    printf "'s3-cli auth'\n"
    echo
    exit 1
  fi

# Check if the credentials are valid
  if ! aws sts get-caller-identity > /dev/null 2>&1; then
    echo "AWS credentials are invalid or expired. Run:"
    echo
    printf "'s3-cli auth'\n"
    echo
  fi
}