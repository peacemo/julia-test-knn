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

1. 一个算法一个文件，因此源码位于 `[./src/knn.jl](./src/knn.jl)` 

2. 编写源代码，并将源码包含进模块 [./src/TyKNN.jl](./src/TyKNN.jl)

    ```julia
    module TyKNN

    export knn
    include("knn.jl")

    end # module TyKNN
    ```

## 测试

1. 创建 test 文件夹

2. 创建 test 环境的 Project.toml: `pkg> activate ./test  &&  pkg> add [some deps]`

3. 创建 `./test/runtests.jl`，编写测试代码

4. 运行 pkg> test (REPL)
