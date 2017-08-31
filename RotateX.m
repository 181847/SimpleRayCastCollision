%radian: 绕X轴旋转弧�
%rotationMatrix: 只包含X轴旋转的仿射变换矩阵，DirectX标准�
function rotationMatrix = RotateX(radian)
    rotationMatrix = eye(4);
    cosN = cos(radian);
    sinN = sin(radian);
    rotationMatrix(2, 2) = cosN;
    rotationMatrix(2, 3) = sinN;
    rotationMatrix(3, 2) = -sinN;
    rotationMatrix(3, 3) = cosN;
end
