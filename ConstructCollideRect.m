%构建一个长方形碰撞体。
%size: 3x2矩阵，长方体的尺寸，三行分别对应xyz的最小和最大值。
%world: 4x4，碰撞体的世界坐标，不能包含缩放。
%type: 标记碰撞体的类型。
%cRect: 4x6，cRect(1:3, 1:2) == size。
%   cRect(1:4, 3:6) == world,
%   cRect(4, 1) 包围球的半径平方。
%   cRect(4, 2) 类型标记。
function cRect = CreateCollideRect(size, world, type)
    rectShape = RectShape(size, type);
    cRect = [rectShape world];
end
