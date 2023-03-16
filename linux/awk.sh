# Print the first field of each line in a file:
awk '{print $1}' file.txt

# Print the number of lines in a file:
awk 'END {print NR}' file.txt

# Print the sum of values in the third field of a file:
awk '{ sum += $3 } END { print sum }' file.txt

# Print the number of times a pattern appears in a file:
awk '/pattern/ { count++ } END { print count }' file.txt

# Print the lines that contain a pattern:
awk '/pattern/ { print }' file.txt

# Print the lines that do not contain a pattern:
awk '!/pattern/ { print }' file.txt

# Print the lines between two patterns:
awk '/start/,/end/ { print }' file.txt

# Print the lines that are longer than a certain length:
awk 'length > 80 { print }' file.txt

# Print the average of values in the second field of a file:
awk '{ sum += $2 } END { print sum / NR }' file.txt

# Print the lines in reverse order:
awk '{ lines[NR] = $0 } END { for(i=NR;i>0;i--) print lines[i] }' file.txt

# Replace a pattern with another string:
awk '{ gsub(/pattern/, "replacement"); print }' file.txt

# Print the lines that match a regular expression:
awk '/^([a-z]+\d+)+$/ { print }' file.txt

# Print the lines with fields separated by a specific delimiter:
awk -F',' '{ print $1, $3 }' file.txt

# Print the lines that have a specific value in a field:
awk '$2 == "value" { print }' file.txt

# Print the lines that have a value in a field within a specific range:
awk '$3 > 50 && $3 < 100 { print }' file.txt

# Print the lines that have duplicate values in a field:
awk -F',' '{ count[$2]++ } END { for(i in count) if(count[i]>1) print i }' file.txt

# Print the lines that have the same value in a field as the previous line:
awk 'NR>1 && $1 == prev { print } { prev = $1 }' file.txt

# Print the lines that have a specific value in a field and sort them:
awk '$2 == "value" { print }' file.txt | sort

# Print the lines that have a specific value in a field and count them:
awk '$2 == "value" { count++ } END { print count }' file.txt

# Print the lines that have a specific value in a field and calculate the sum of another field:
awk '$2 == "value" { sum += $3 } END { print sum }' file.txt

##############################

- name: Print the first column of a file
  command: awk '{print $1}' filename.txt
  
- name: Print the second column of a file
  command: awk '{print $2}' filename.txt
  
- name: Print the last column of a file
  command: awk '{print $NF}' filename.txt
  
- name: Print lines that match a pattern
  command: awk '/pattern/ {print}' filename.txt
  
- name: Print lines that do not match a pattern
  command: awk '!/pattern/ {print}' filename.txt
  
- name: Print lines that have more than two fields
  command: awk 'NF > 2 {print}' filename.txt
  
- name: Print lines that have less than two fields
  command: awk 'NF < 2 {print}' filename.txt
  
- name: Print the sum of a column
  command: awk '{sum+=$1} END {print sum}' filename.txt
  
- name: Print the average of a column
  command: awk '{sum+=$1} END {print sum/NR}' filename.txt
  
- name: Print the highest value in a column
  command: awk 'max<$1 {max=$1} END {print max}' filename.txt
  
- name: Print the lowest value in a column
  command: awk 'min>$1 || NR==1 {min=$1} END {print min}' filename.txt


