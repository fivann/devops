# Basics
# chek identity
aws sts get-caller-identity

# configure profile
aws configure --profile myacc
# and use it
aws s3 ls --profile myacc
