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
    # error=$(git cherry-pick -m 1 "$commit_hash")
    # echo "error --> $erorr"
    git cherry-pick -m 1 "$commit_hash"
    cherry_pick_status=$?

    if [ $cherry_pick_status -eq 0 ]; then
        # git push origin "$element"
        echo "Success sync branch $element!"
    else
        # git cherry-pick --abort
        echo "Failed sync branch $element!"
    fi
    git cherry-pick --abort
done
git checkout main
