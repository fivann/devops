# Searches for a specific pattern in a file:
grep "pattern" filename

# Searches for a pattern in multiple files:
grep "pattern" file1 file2

# Searches for a pattern in all files in a directory:
grep "pattern" *

# Searches for a pattern in all files in a directory and its subdirectories:
grep "pattern" -r directory/

# Searches for a pattern in a compressed file:
grep "pattern" file.gz

# Searches for a pattern in multiple compressed files:
zgrep "pattern" file1.gz file2.gz

# Searches for a pattern in a file and displays the line number:
grep -n "pattern" filename

# Searches for a pattern in a file and displays the matching line:
grep -o "pattern" filename

# Searches for a pattern in a file and displays the number of matches:
grep -c "pattern" filename

# Searches for a pattern in a file and displays the surrounding context:
grep -C 5 "pattern" filename

# Searches for a pattern in a file and displays the surrounding lines of context:
grep -A 3 -B 2 "pattern" filename

# Searches for a pattern in a file and ignores case:
grep -i "pattern" filename

# Searches for a pattern in a file and displays the filename and matching line:
grep -H "pattern" filename

# Searches for a pattern in a file and displays only the filename:
grep -l "pattern" *

# Searches for a pattern in a file and displays only the matching text:
grep -o "pattern" filename

# Searches for a pattern in a file and displays the inverse of the match:
grep -v "pattern" filename

# Searches for a pattern in a file and displays the lines before and after the match:
grep -A 2 -B 2 "pattern" filename

# Searches for a pattern in a file and displays the lines before the match:
grep -B 3 "pattern" filename

# Searches for a pattern in a file and displays the lines after the match:
grep -A 2 "pattern" filename

# Searches for a pattern in a file and displays the number of matches in each file:
grep -c "pattern" *

# Searches for a pattern in a file and displays the files that do not contain the pattern:
grep -L "pattern" *

# Searches for a pattern in a file and displays the files that contain the pattern:
grep -l "pattern" *

# Searches for a pattern in a file and displays the files that contain the pattern, recursively:
grep -rl "pattern" directory/

# Searches for a pattern in a file and only displays the matches that are whole words:
grep -w "pattern" filename

# Searches for a pattern in a file and only displays the matches that are not whole words:
grep -vw "pattern" filename

# Searches for a pattern in a file and only displays the matches that start with the pattern:
grep "^pattern" filename

# Search for a specific string in a file:
grep "string" file.txt

# Search for a string in multiple files:
grep "string" file1.txt file2.txt file3.txt

# Search for a string in all files in a directory:
grep "string" *

# Search for a string in all files in a directory and its subdirectories:
grep -r "string" *

# Search for a string in all files of a specific type in a directory and its subdirectories:
grep -r "string" *.txt

# Ignore case when searching for a string:
grep -i "string" file.txt

# Display the line number where a string is found:
grep -n "string" file.txt

# Display the context surrounding a matched string:
grep -C 3 "string" file.txt

# Display only the matched string:
grep -o "string" file.txt

# Display all lines that do not contain the specified string:
grep -v "string" file.txt

# Search for a string and output the results to a new file:
grep "string" file.txt > newfile.txt

# Search for a string and append the results to an existing file:
grep "string" file.txt >> existingfile.txt

# Search for a string in compressed files:
zgrep "string" file.gz

# Search for a string in multiple compressed files:
zgrep "string" file1.gz file2.gz

# Search for a string in a directory of compressed files:
zgrep "string" *.gz

# Search for a string in binary files:
grep -a "string" binaryfile.bin

# Count the number of occurrences of a string:
grep -c "string" file.txt

# Search for a string in a specific line range:
sed -n '10,20p' file.txt | grep "string"

# Search for a string and include all subdirectories except a specific one:
grep -r --exclude-dir=dir "string" *

# Search for a string in a specific file type and display the matching file name:
grep -rl "string" *.txt

# Search for a string in a specific file type and display the number of matches in each file:
grep -rc "string" *.txt

# Search for a string in a specific file type and display the file name and line number of each match:
grep -rn "string" *.txt

# Search for a string in a specific file type and limit the search to a specific directory depth:
grep -r --max-depth=2 "string" *

# Search for a string in a specific file type and exclude certain files from the search:
grep -r --exclude="file.txt" "string" *

#####################
#### KEYS
#####################


# -i (ignore case): Ignores case when searching for a pattern.
grep -i "example" file.txt

# -w (whole word): Only matches whole words instead of partial matches.
grep -w "example" file.txt

# -v (invert match): Displays all lines that do not match the pattern.
grep -v "example" file.txt

# -c (count): Displays the count of lines that match the pattern.
grep -c "example" file.txt

# -l (list files): Displays the file names that contain the pattern.
grep -l "example" *.txt

# -n (line number): Displays the line number of the matched pattern.
grep -n "example" file.txt

# -r (recursive): Searches all files in the specified directory and its subdirectories.
grep -r "example" /path/to/directory/

# --include and --exclude: Include or exclude specific files from the search.
grep "example" --include=*.txt --exclude=*~ /path/to/directory/

# -e (expression): Allows for multiple patterns to be searched for at once.
grep -e "example1" -e "example2" file.txt

# -A (after-context) and -B (before-context): Display a specific number of lines before or after the matched pattern.
grep -A 2 -B 2 "example" file.txt

# -m (max count): Limit the number of matches that will be displayed.
grep -m 5 "example" file.txt

# -f (file): Use a file as the pattern instead of a string.
grep -f pattern.txt file.txt

# -q (quiet): Suppress the output and only return the exit status.
grep -q "example" file.txt

# --color: Highlight the matched pattern in color.
grep --color "example" file.txt

# -z (null data): Treat input files as null data-separated.
grep -z "example" file.txt

