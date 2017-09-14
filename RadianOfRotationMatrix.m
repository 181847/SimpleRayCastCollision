function [rx, ry] = RadianOfRotationMatrix(RM)
%计算RM（4x4）矩阵中的俯仰角和偏航角角度。
%-(pi/2) < rx < (pi/2)。
%0 < ry < pi。
%RM 4x4的矩阵，不能包含缩放因子，计算时只考虑RM的旋转部分。

    %按照Directx中的Z轴正方向为初始方向
    unitVector = [0, 0, 1, 0];
    %旋转单位向量
    unitVector *= RM;
    
    x = unitVector(1);
    y = unitVector(2);
    z = unitVector(3);
    
    if z < 0,
        % 如果Z小于0，绕y轴的旋转角度应该加上pi。
        ryFlag = 1;
    else
        ryFlag = 0;
    end
    
    rx = - asin(y);
    ry = ryFlag * pi + atan(unitVector(1)/unitVector(3));
end
