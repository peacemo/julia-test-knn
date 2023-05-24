using Distances

function knn(X_train, y_train, X_test, K)
    N_test = size(X_test, 1)
    N_train = size(X_train, 1)
    y_pred = Vector{eltype(y_train)}(undef, N_test)
    
    for i in 1:N_test
        distances = pairwise(SqEuclidean(), X_train', X_test[i, :]')
        sorted_indices = sortperm(distances, rev=false)
        k_indices = sorted_indices[1:K]
        k_labels = y_train[k_indices]
        
        counts = Dict{eltype(y_train), Int}()
        for label in unique(k_labels)
            counts[label] = count(x -> x == label, k_labels)
        end
        
        max_count = -1
        max_label = y_train[1]
        for (label, count) in counts
            if count > max_count
                max_count = count
                max_label = label
            end
        end
        
        y_pred[i] = max_label
    end
    
    return y_pred
end
