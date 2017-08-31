%radian: 绕Z轴旋转弧度
%rotationMatrix: 只包含Z轴旋转的仿射变换矩阵，DirectX标准。
function rotationMatrix = RotateZ(radian)
    rotationMatrix = eye(4);
    cosN = cos(radian);
    sinN = sin(radian);
    rotationMatrix(1, 1) = cosN;
    rotationMatrix(1, 2) = sinN;
    rotationMatrix(2, 1) = -sinN;
    rotationMatrix(2, 2) = cosN;
end
