echo "======start repo sync======"
repo sync -c -j32 --no-clone-bundle
while [ $? = 1 ]; do
    echo "======get remaining space======"
    df -hT
    echo "======sync failed, re-sync again======"
    sleep 3
    repo sync -c -j32 --no-clone-bundle
done