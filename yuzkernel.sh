echo "======start repo sync======"
failure=0
repo sync -c -j32 --no-clone-bundle
while [ $? -ne 0 ]; do
    echo "======get remaining space======"
    df -hT
    echo "======sync failed, re-sync again======"
    failure=$(($failure+1))
    sleep 3
    repo sync -c -j32 --no-clone-bundle
done

if [ $failure = 10 ]; then
    echo "======Too many attempts======"
    exit 1
fi