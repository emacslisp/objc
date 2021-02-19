export SDKROOT=$(xcrun --show-sdk-path)

echo "building m file"
for fname in *.m
do
    if [ "${fname%%.*}" != "main" ]; then
        echo ${fname%%.*}.m
        clang -c ${fname%%.*}.m -o ${fname%%.*}.o
    fi
done

ar r lib.a *.o

clang -framework Foundation main.m lib.a -o main.run
./main.run