# echo "# this file is located in 'src/auth_command.sh'"
# echo "# code for 's3-cli auth' goes here"
# echo "# you can edit it freely and regenerate (it will not be overwritten)"
# inspect_args

#Clean Up the Credentials File
rm -rf $CREDENTIALS_FILENAME

ROLE_ARN="arn:aws:iam::123456789012:role/YourRoleName"
ROLE_SESSION_NAME="s3-cli-$USER"

# Assume the role and capture the output
STS_OUTPUT=$(aws sts assume-role --role-arn "$ROLE_ARN" --role-session-name "$ROLE_SESSION_NAME")

# Check if assume-role was successful
if [ $? -ne 0 ]; then
  echo "Failed to assume role"
  exit 1
fi

# Extract credentials from the STS output
AWS_ACCESS_KEY_ID=$(echo $STS_OUTPUT | jq -r '.Credentials.AccessKeyId')
AWS_SECRET_ACCESS_KEY=$(echo $STS_OUTPUT | jq -r '.Credentials.SecretAccessKey')
AWS_SESSION_TOKEN=$(echo $STS_OUTPUT | jq -r '.Credentials.SessionToken')

# Create or reuse a temporary file
touch $CREDENTIALS_FILENAME

# Write the credentials to the temp file
cat > $CREDENTIALS_FILENAME <<EOL
export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
export AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN
EOL

# Inform the user
echo "Credentials saved to $CREDENTIALS_FILENAME"