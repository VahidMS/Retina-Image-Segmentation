% clear all;close all; 
% clc
% addpath(genpath('../../Codes'))
isFakePadUsed = 1;
disp('Method 1');
tic
se = 0;
sp = 0;
for i=imgnum:imgnum
    %% Read Image and Manuals
    arbitrary = 1
    imgURL = '/media/vahid/A702F3CB94499E8A/Profession/Company/Daneshbonyan/Products/Retina DaneshBonyan/Code/images/DRHAGIS/24.jpg'
    makeImsSuitable
    %% Calling Segmentation Or Vascular Detection Method
    %% Kmeans Mine
    disp(['image Number = ' num2str(i)])
    kMeansError=0;
    [diffDark diffBack diffBright] = kmeans3Class(greenIm, imMask,...
        kMeansError,0, 1,29);
    [diffBright] = fakepad(diffBright,imMask);   
    %% Line Detection
    newIm =diffBright;
    %newIm = 255-greenIm;
    lineDetectionPart
  time = toc/60
  if arbitrary ~= 1
    a = performanceMeasures(manual1,imMask,stS>.7,1);
    se = se + a(6);
    sp = sp + a(7);
    disp('SE = ')
    disp(se)
    disp('SP = ')
    disp(sp)
  end 
    figure
    subplot(1,2,1), imshow(im)
    subplot(1,2,2), imshow(stS>1)
    
 KL1 = stS>.75;
 imshow(bS)

%     mkdir('probImagesLineKMeansRevised')
%     if i<10
%          save(['probImagesLineKMeansRevised/im0' num2str(i) '.mat'],'imMask', 'bS','S','stS','SPr', 'greenIm', 'greenImC','manual1','manual2');
%     else
%          save(['probImagesLineKMeansRevised/im' num2str(i) '.mat'],'imMask', 'bS','S','stS','SPr', 'greenIm', 'greenImC', 'manual1','manual2');
%     end
end