list=("lib" "test" "*/lib" "*/test")
for item in ${list[@]}; do
    flutter format $item
done
