%ray: 4x4 射线定义四维矩阵，使用仿射矩阵的格式3x3的旋转向量表示方向，平移表示射线的起始点��
%rayMax: 射线的最大碰撞长度，超过这个长度的部分不考虑碰撞��
%collideRect: 3x2矩阵，长方形碰撞体大小，定义XYZ轴的距离，[Xmin, Xmax; Ymin, Ymax; Zmin, Zmax]
%collideWorld: 碰撞体的世界变换矩阵��
%isCollided: 1x1, 是否发生碰撞��
%collideLocation: 1x3, 碰撞发生点的世界坐标��
%t: 起点到碰撞点的距离��
function [isCollided, collideLocation, t] = RayCollideCheck(ray, rayMax, collideRect, collideWorld)
    %将射线转换到碰撞体的局部坐标中.
    newRay = ray * inv(collideWorld);
    
    %提取坐标位移.
    rPosition = newRay(4, 1:3);
    
    %单位向量，尝试获取射线在碰撞体局部空间中的方向��
    %注意默认Z轴正方向为前方向��
    rDirection = [0, 0, 1, 0];
    rDirection = rDirection * newRay;
    
    %为了方便计算，将射线的向量和坐标复制成为3x2的矩矩阵��
    rDirection = [rDirection(1:3)', rDirection(1:3)'];
    rPosition = [rPosition', rPosition'];
    
    t = (collideRect - rPosition) ./ rDirection;
    %清空所有除0得到的NaN结果��
    %t = ClearNaN(t);
    
    %将xyz三个方向上的最小的t提取出来��
    tmin = [min(t(1, :)), min(t(2, :)), min(t(3, :))];
    %将xyz三个方向上最大的t提取出来��
    tmax = [max(t(1, :)), max(t(2, :)), max(t(3, :))];
    
    maxt = max(tmin);
    mint = min(tmax);
    
    if maxt < mint && maxt >= 0 && maxt < rayMax,
        isCollided = 1;
        %计算碰撞点的世界坐标
        worldDirection = [0, 0, 1, 0] * ray;
        collideLocation = ray(4, 1:3) + maxt * worldDirection(1:3);
        t = maxt;
    else
        isCollided = 0;
        collideLocation = zeros(1, 3);
        t = 0;
    end
end
