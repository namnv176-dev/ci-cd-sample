commit_hash="97d3522e7f7311c87db8952b63ca35e7c57d3ae2"
# String to split
input_string="sync-branch,test-sync1,test-sync2,test-sync3"

# Split the string into an array
IFS="," read -r -a branches <<< "${input_string}"

# Loop through the array elements
for element in "${branches[@]}"
do
    echo "Start sync branch: $element"
    git checkout "$element"
    git cherry-pick -m 1 "$commit_hash" >/dev/null 2>&1
    # Check if cherry-pick was successful
    if [ $? -eq 0 ]; then
        git push origin "$element"
        echo "Success sync branch $element!"
    else
        git cherry-pick --abort
        echo "Failed sync branch $element!"
    fi
done