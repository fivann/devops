# Some examples of complex bash commands or scripts that can be used for different purposes.

# A script that uses the find command to search for files with specific permissions and then changes them:
find /path/to/dir -type f -perm 644 -exec chmod 755 {} \;

# A script that uses awk to process a CSV file and extract specific columns:
awk -F, '{print $1, $4, $7}' input.csv

# A script that uses sed to replace all occurrences of a specific string in multiple files:
find . -type f -exec sed -i 's/old-string/new-string/g' {} +

# A script that uses xargs to parallelize the execution of a command:
find . -name "*.txt" | xargs -P4 -I{} cat {}

# A script that uses the read command to read input from the user and pass it to a command:
read -p "Enter a string: " str
echo "You entered: $str"

# A script that uses the while loop to read lines from a file and process them:
while read line; do
    echo $line
done < input.txt

# A script that uses the for loop to iterate over a range of numbers and execute a command:
for i in {1..10}; do
    echo $i
done

A script that uses the if statement to check the exit status of a command and take action:
if grep -q "string" input.txt; then
    echo "String found"
else
    echo "String not found"
fi

# A script that uses the case statement to handle multiple options:
read -p "Enter a number: " num
case $num in
    1) echo "One";;
    2) echo "Two";;
    3) echo "Three";;
    *) echo "Invalid option";;
esac

# A script that uses the function to encapsulate a piece of logic:
function hello {
    echo "Hello, $1"
}
hello "world"
