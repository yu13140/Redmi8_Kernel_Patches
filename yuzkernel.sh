echo "======start repo sync======"
repo sync -c -j32 --no-clone-bundle
while [ $? = 1 ]; do
    echo "======sync failed, re-sync again======"
    sleep 3
    repo sync -c -j32 --no-clone-bundle
done
