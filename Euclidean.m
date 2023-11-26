function [result] = Euclidean(vector1,vector2)
    result = sqrt(sum((vector2-vector1).^2));
end