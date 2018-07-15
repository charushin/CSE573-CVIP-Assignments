function [wordMap] = getVisualWords(img, filterBank, dictionary)
% Compute visual words mapping for the given image using the dictionary of visual words.

% Inputs:
% 	img: Input RGB image of dimension (h, w, 3)
% 	filterBank: a cell array of N filters
% Output:
%   wordMap: WordMap matrix of same size as the input image (h, w)

    % TODO Implement your code here
    if ndims(img) <= 2
           img=repmat(img,[1,1,3]);
    end
    filteredImage=extractFilterResponses(img,filterBank);
    [r,c,p]=size(filteredImage);
    
    %wordMap=ones(r,c);
    wordMap=[];
    img_new=reshape(filteredImage,[r*c p]);
    
    %dist=pdist2(img_new,dictionary);
    mn_dist=knnsearch(dictionary,img_new);
    wordMap=reshape(mn_dist, [r c]);
end
