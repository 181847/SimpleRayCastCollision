%xyzRadian: 1x3/3X1，绕ZXY方向的旋转弧度，向量的三个元素依次为Z、X、Y
%rorationMatrix: 依次按照先Z、X、Y轴的旋转方向旋转。
function rotationMatrix = RotateZXY(xyzRadian)
    rotationMatrix = RotateZ(xyzRadian(1)) * RotateX(xyzRadian(2)) * RotateY(xyzRadian(3));
end
