## check if a bucket has a web site configured

for BUCKET in `gsutil ls`; do
  echo "Checking $BUCKET"
  gsutil web get $BUCKET
done

## or just

for BUCKET in `gsutil ls`; do echo "Checking $BUCKET"; gsutil web get $BUCKET; done


