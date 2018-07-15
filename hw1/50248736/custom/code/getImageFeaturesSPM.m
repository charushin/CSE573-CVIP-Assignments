function [h] = getImageFeaturesSPM(layerNum, wordMap, dictionarySize)
% Compute histogram of visual words using SPM method
% Inputs:
%   layerNum: Number of layers (L+1)
%   wordMap: WordMap matrix of size (h, w)
%   dictionarySize: the number of visual words, dictionary size
% Output:
%   h: histogram of visual words of size {dictionarySize * (4^layerNum - 1)/3} (l1-normalized, ie. sum(h(:)) == 1)
    
    % TODO Implement your code here
    %to combine 4x4 histogram
    h1=[];
    h2=[];
    h3=[];
    h=[];
    %to keep all results seperate
    [r, c]=size(wordMap);
    subMatrixSize=4;
   % subMatCells1=mat2cell(wordMap, diff(round(linspace(0, r, subMatrixSize+1))), diff(round(linspace(0, c, subMatrixSize+1))));
    
     subMatCells1=mat2cell(wordMap, diff(round(linspace(0, r, subMatrixSize+1))), diff(round(linspace(0, c, subMatrixSize+1))));
     
    subSections=size(subMatCells1,1)*size(subMatCells1,2);
    for i=1:subSections
     [r1,c1]=size(subMatCells1{i});
     r2=ceil(r/subMatrixSize);
     c2=ceil(c/subMatrixSize);
     %disp(subMatCells1{i});
    % subMatCells1{i}(ceil(r/subMatrixSize),ceil(c/subMatrixSize))=0.0;
     subMatCells1{i}=padarray(subMatCells1{i},[r2-r1 c2-c1],0,'post');
     cellHist= getImageFeatures(subMatCells1{i},dictionarySize);
      %h=cat(1,h,(1/2)*hu{i});
     % h=[cellHist;h];
     h1=cat(1,h1,cellHist);
    end
 
    subMatCells2=cell(subMatrixSize/2,subMatrixSize/2);
    mat=[];
 
    mat{1}=cat(1,subMatCells1{1},subMatCells1{2});
    mat{2}=cat(1,subMatCells1{5},subMatCells1{6});
    mat{3}=cat(1,subMatCells1{3},subMatCells1{4});
    mat{4}=cat(1,subMatCells1{7},subMatCells1{8});
    mat{5}=cat(1,subMatCells1{9},subMatCells1{10});
    mat{6}=cat(1,subMatCells1{13},subMatCells1{14});
    mat{7}=cat(1,subMatCells1{11},subMatCells1{12});
    mat{8}=cat(1,subMatCells1{15},subMatCells1{16});
    subMatCells2{1}=cat(2,mat{1},mat{2});
    subMatCells2{2}=cat(2,mat{3},mat{4});
    subMatCells2{3}=cat(2,mat{5},mat{6});
    subMatCells2{4}=cat(2,mat{7},mat{8});
    %mat=mat2cell(
    
    for i=1:size(subMatCells2,1)*size(subMatCells2,2)
        cellHist= getImageFeatures(subMatCells2{i},dictionarySize);
        h2=cat(1,h2,cellHist);
    end
    
    subMatCells3=cat(2,cat(1,subMatCells2{1},subMatCells2{2}),cat(1,subMatCells2{3}, subMatCells2{4}));
    h3=getImageFeatures(subMatCells3,dictionarySize);
    
    h=cat(1,h1,h2,h3);
    h=h/norm(h,1);
   %h=subMatCells1;
    %h=mat;
    

end