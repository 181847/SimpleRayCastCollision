%radian: 绕Y轴旋转弧度
%rotationMatrix: 只包含Y轴旋转的仿射变换矩阵，DirectX标准。
function rotationMatrix = RotateY(radian)
    rotationMatrix = eye(4);
    cosN = cos(radian);
    sinN = sin(radian);
    rotationMatrix(1, 1) = cosN;
    rotationMatrix(1, 3) = -sinN;
    rotationMatrix(3, 1) = sinN;
    rotationMatrix(3, 3) = cosN;
end
