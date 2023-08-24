# String to split
input_string="sync-branch,test-sync1,test-sync2,test-sync3"

# Split the string into an array
IFS="," read -r -a arr <<< "${input_string}"

# Loop through the array elements
for element in "${arr[@]}"
do
    echo "$element"
done