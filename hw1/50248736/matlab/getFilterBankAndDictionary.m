function [filterBank, dictionary] = getFilterBankAndDictionary(imPaths)
% Creates the filterBank and dictionary of visual words by clustering using kmeans.

% Inputs:
%   imPaths: Cell array of strings containing the full path to an image (or relative path wrt the working directory.
% Outputs:
%   filterBank: N filters created using createFilterBank()
%   dictionary: a dictionary of visual words from the filter responses using k-means.

    filterBank  = createFilterBank();
   % filterResponses=cell(1,numel(length(imPaths)));
   % filterResponses=[];
    a=120;
    K=140;
    sampledData=[];
    % TODO Implement your code here
   for i=1:length(imPaths)
       disp(i);
       img=imread(imPaths{i});
       %[x y z]=size(img);
       if ndims(img) <= 2
           img=repmat(img,[1,1,3]);
       end
       %img=im2double(img);
       %img=imread('..\data\library\sun_bikkrgtvixmjwoas.jpg');
        filterImage=extractFilterResponses(img,filterBank);
        [r c p] = size(filterImage);
        filterImage2=reshape(filterImage,[r*c p]);
        randPix=randperm(r*c,a);
        [h w]=size(randPix); 
        randArray=filterImage2(randPix,:);
        %randArray=randPerm(filterImage,a);
        sampledData=cat(1,sampledData,randArray);
   end    
     
   % dictionary= kmeans(sampledData, K, EmptyAction,drop);
   [~, dictionary] = kmeans(sampledData, K, 'EmptyAction','drop');
    %disp(dictionary);
   % disp(size(imPaths 160 1
    
     

end
