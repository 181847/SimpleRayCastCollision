%根据长方形碰撞体的尺寸，计算一个最大半径球体来包围整个长方体。
%rect: 4x2矩阵，前三行表示长方形的尺寸rect(4, 1)表示球体的半径的平方。
%   rect(4, 2)记录的是长方体的尺寸。
function rect = RectShape(rectSize, type)
    %找到尺寸中最大的值，因为球体的中心固定在原点，尝试找到最大的半径来包围整个长方体。
    squareRadius = sum(max(rectSize, [], 2).^2);
    
    rect = [rectSize; squareRadius type];
end
