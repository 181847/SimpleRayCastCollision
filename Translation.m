function translationMatrix = Translation(xyz)
    translationMatrix = eye(4);
    translationMatrix(4, 1:3) = xyz;
end
