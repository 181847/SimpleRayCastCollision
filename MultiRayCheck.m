%此函数内部包含一系列固定的碰撞体，用于模拟和多个碰撞体碰撞的情况。
%ray: 射线旋转方向，射线的起点。
%rayMax: 射线的最大长度。
%targetType: 期待碰撞的碰撞体，每一个碰撞体都会有一个标记，这一项用来指定碰撞体的类型。
%isCollided: 是否发生碰撞。
%closestLocation: 发生碰撞的最近的一个坐标。
function [isCollided, closestLocation, collideIndex] = MultiRayCheck(ray, rayMax, targetType)
    load Rects.dat;
    
    isCollided = 0;
    closestLocation = [0 0 0];
    collideIndex = 0;
    %unit from rayStartLocation to CollideLocation 
    tmin = 0;
    
    for i = 1:size(Rects, 1) / 4,
        %4x6
        rect = Rects((i - 1) * 4 + 1: i * 4, :);
        
        %check Type
        if rect(4, 2) == targetType, 
            
            %collide Detact
            [ic loc tl] = RayCheckWithSphere(ray, rayMax, rect);
            
            if ic == 0,
                continue;
            end
            
            if isCollided == 0, 
                closestLocation = loc;
                isCollided = 1;
                tmin = tl;
                collideIndex = i;
            else
                %is the location closer?
                if tl < tmin,
                    closestLocation = loc;
                    tmin = tl;
                    collideIndex = i;
                end
            end
        end
    end
end
