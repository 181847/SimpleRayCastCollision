function [isCollided, location, tl] = RayCheckWithSphere(ray, rayMax, rect4x6)
    %sphere check
    rayLoc = ray(4, 1:3);
    sphereLoc = rect4x6(4, 3:5);
    locVector = sphereLoc - rayLoc;
    
    rayVector = [0 0 1 0];
    rayVector *= ray;
    rayVector = rayVector(1:3);
    
    squareDist = sum(cross(locVector, rayVector) .^ 2);
    
    %collide with sphere ?
    if squareDist < rect4x6(4, 1)
        [isCollided, location, tl] =...
            RayCollideCheck(ray, rayMax, rect4x6(1:3, 1:2), rect4x6(1:4, 3:6));
    else
        isCollided = 0;
        location = zeros(1, 3);
        tl = 0;
    end
end
