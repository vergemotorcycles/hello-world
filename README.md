# QT Hello World

Two simple Qt Quick applications 

To build the apps you need to run:

```shell
# First build "hello"
docker build . --platform linux/arm64 --build-arg=SRC_DIR=app-hello -t app-hello

# Then build "world"
docker build . --platform linux/arm64 --build-arg=SRC_DIR=app-world -t app-world
```

> [!NOTE]
> The final result should look like this
> 
> <img src="https://github.com/user-attachments/assets/52fcb0ef-b50a-4b4c-a33a-06386d78c7bb" width="480px">
