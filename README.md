# Julia KNN: 从头开始创建一个 Julia 包

## 项目初始化

1. 在一个目录下初始化项目结构 (Julia REPL): `pkg> generate TyKNN` 

    ```
        .
    ├── Project.toml
    ├── README.md
    └── src
        └── TyKNN.jl

    1 directory, 3 files
    ```

2. 激活到当前的目录 (REPL): `pkg> activate .` 

## 开发

1. 一个算法一个文件，本次只有 KNN，因此源码位于 `[./TyKNN/src/TyKNN.jl](./TyKNN/src/TyKNN.jl)` 

2. 编写源代码，并
