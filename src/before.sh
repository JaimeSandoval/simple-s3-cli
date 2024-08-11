## before hook
##
## Any code here will be placed inside a `before_hook()` function and called
## before running any command (but after processing its arguments).
##
## You can safely delete this file if you do not need it.
# echo "==[ Before Hook Called ]=="

# Variables
ROLE_ARN="arn:aws:iam::123456789012:role/YourRoleName"
ROLE_SESSION_NAME="YourSessionName"

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

# Export credentials as environment variables
export AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY
export AWS_SESSION_TOKEN