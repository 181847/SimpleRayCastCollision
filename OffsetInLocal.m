function [rx, ry] = OffsetInLocal(worldTransform, worldTarget, needRx)
%这个方程用来计算指定物体到目标点的旋转弧度。
%worldTransform: 指定物体的世界变换矩阵。
%worldTarget: 3x1，处于世界坐标中的目标平移坐标。
%needRx: 如果传入此参数，表明需要计算rx，rx的计算涉及开根号，如果非必要，请不要使用这个参数��
%       如果不传入此参数，rx默认为0
%-(pi/2) < rx < (pi/2)。
%0 < ry < pi。

    
    %转换到局部坐标系中。
    
    target = worldTarget * inv(worldTransform);
    
    rx = 0;
    
    x = target(1);
    y = target(2);
    z = target(3);
    ry = atan(x / z);
    
    if z < 0 && x > 0,
        ry += pi;
    else if z < 0 && x < 0,
        ry = - pi + ry;
    end
    
    %检查是否计算rx
    if exist('needRx', 'var')
        %单位化
        target = target(1:3);
        target = target ./ sqrt(target * target');
        rx = -asin(target(2));
    end
    
     
 end
