function clearResult = ClearNaN(m)
    clearResult = m;
    
    for i = 1:size(m, 1) * size(m, 2),
        if isinf(m(i)),
            clearResult(i) = -1;
        end
    end
end
