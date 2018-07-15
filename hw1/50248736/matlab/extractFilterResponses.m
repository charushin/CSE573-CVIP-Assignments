function [filterResponses] = extractFilterResponses(img, filterBank)
% Extract filter responses for the given image.
% Inputs: 
%   img:                a 3-channel RGB image with width W and height H
%   filterBank:         a cell array of N filters
% Outputs:
%   filterResponses:    a W x H x N*3 matrix of filter responses


% TODO Implement your code here
% filterResponse=imfilter(img,filterBank);
sz=size(filterBank);
N=sz(1);
[r,c,p]=size(img);

filterResponses=[];
lab=rgb2lab(img);

for i=1:N
    filterResponses=cat(3,filterResponses,imfilter(lab,filterBank{i}));
    %filterResponses{i}=imfilter(lab,filterBank{i});
end
%total_array=cat(1,filterResponse{:});
%disp(total_array);



