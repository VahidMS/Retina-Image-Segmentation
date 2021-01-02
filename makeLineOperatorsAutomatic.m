function [lines] = makeLineOperatorsAutomatic(lengthArray)

for k =1: length(lengthArray)
    i = lengthArray(k);    
    l = zeros(i,i);
    l(:,:)=2;
    l0 = l;
%     %**ADDED
%     l0(ceil(i/2):i,:) = 0;
%     l0(1:floor(i/2),:) = 0;
%     %**
    
    l0(ceil(i/2),:) = 1;
    
    
%    l15 = imrotate(l0,15,'crop');
%    l30 = imrotate(l0,30,'crop');
%    l45 = imrotate(l0,45,'crop');
    
    %For Octave
    l15 = imrotate(l0,15,'nearest', 'crop');
    l30 = imrotate(l0,30, 'nearest', 'crop');
    l45 = imrotate(l0,45, 'nearest', 'crop');
    
%     l45(rot90(eye(i,i))==1) = 1;
    l90 = rot90(l0);
    l105 = rot90(l15);
    l120 = rot90(l30);
    l135 = rot90(l45);
    l60 = l30';
    l75 = l15';
    l150 = rot90(l60);
    l165 = rot90(l75);
    
    l0 = sparse(l0);l15 = sparse(l15);l30 = sparse(l30);
    l45 = sparse(l45);l60 = sparse(l60);l75 = sparse(l75);
    l90 = sparse(l90);l105 = sparse(l105);l120 = sparse(l120);
    l135 = sparse(l135);l150 = sparse(l150);l165 = sparse(l165);
    
    lines{k} = {l0,l15,l30,l45,l60,l75,l90,l105,l120,l135,l150,l165};
end
end