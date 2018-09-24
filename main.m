% Create a red rotating image and save in gif
% Author: Zephyr
% 09/24/2018
clear;
clc;
close all;
canvasSize = 400;
blockSize = 160;
boundarySize = 220;
img = zeros(canvasSize, canvasSize, 3);
img((canvasSize-blockSize)/2:(canvasSize+blockSize)/2, (canvasSize-blockSize)/2:(canvasSize+blockSize)/2, 2:3) = 1;
img((canvasSize-boundarySize)/2:(canvasSize-boundarySize)/2+1, (canvasSize-boundarySize)/2:(canvasSize+boundarySize)/2, 2:3) = 1;
img((canvasSize+boundarySize)/2-1:(canvasSize+boundarySize)/2, (canvasSize-boundarySize)/2:(canvasSize+boundarySize)/2, 2:3) = 1;
img((canvasSize-boundarySize)/2:(canvasSize+boundarySize)/2, (canvasSize-boundarySize)/2:(canvasSize-boundarySize)/2+1, 2:3) = 1;
img((canvasSize-boundarySize)/2:(canvasSize+boundarySize)/2, (canvasSize+boundarySize)/2-1:(canvasSize+boundarySize)/2, 2:3) = 1;
figure;
for a = 0 :5 : 359
  rotatedImg = 1-imrotate(img, -a, 'crop');  
  imshow(rotatedImg);
  imwrite(rotatedImg, [num2str(a) '.jpg']);
  [I,map]=rgb2ind(rotatedImg,256);
  if(a==0)
      imwrite(I,map,'movefig.gif','DelayTime',0.01,'LoopCount',Inf);
  else
      imwrite(I,map,'movefig.gif','WriteMode','append','DelayTime',0.01);
  end
end

