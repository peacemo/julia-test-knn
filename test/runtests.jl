using Test, RDatasets
using TyKNN

@testset "knn" begin
    # 加载鸢尾花数据集
    iris = dataset("datasets", "iris")

    # 数据预处理
    X = Matrix(iris[:, 1:4])
    y = iris[:, 5]

    X_test = [5.1 3.5 1.4 0.2;
          7.2 3.2 6.0 1.8;
          6.3 3.3 6.0 2.5]
    K = 5
    
    predicted_labels = knn(X, y, X, K)
    @test isa(predicted_labels, Vector)
end