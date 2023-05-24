# 定义距离度量函数（欧氏距离）
function euclidean_distance(x1, x2)
    return sum((x1 - x2).^2)  # 不开方
end

# KNN算法
function knn(X_train, y_train, X_test, K)
    predictions = []
    for i in 1:size(X_test, 1)
        x_test = X_test[i, :]

        # 存储距离和标签
        dist_labels = []

        # 计算距离
        for i in 1:size(X_train, 1)
            dist = euclidean_distance(x_test, X_train[i, :])
            push!(dist_labels, (dist, y_train[i]))
        end

        # 按距离排序
        sort!(dist_labels, by = x -> x[1])

        # 选择最近的K个样本
        k_nearest = dist_labels[1:K]

        # 标签投票
        votes = Dict()
        for i in 1:K
            label = k_nearest[i][2]
            if haskey(votes, label)
                votes[label] += 1
            else
                votes[label] = 1
            end
        end

        # 找出票数最多的标签
        max_votes = 0
        predicted_label = ""
        for (label, vote_count) in votes
            if vote_count > max_votes
                max_votes = vote_count
                predicted_label = label
            end
        end

        push!(predictions, predicted_label)
    end

    return predictions
end
