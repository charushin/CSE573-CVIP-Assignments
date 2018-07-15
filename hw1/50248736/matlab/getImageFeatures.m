function [h] = getImageFeatures(wordMap, dictionarySize)
% Compute histogram of visual words
% Inputs:
% 	wordMap: WordMap matrix of size (h, w)
% 	dictionarySize: the number of visual words, dictionary size
% Output:
%   h: vector of histogram of visual words of size dictionarySize (l1-normalized, ie. sum(h(:)) == 1)

	% TODO Implement your code here
	
    %h=[];
    %h= histogram(wordMap,dictionarySize, 'Normalization','cumcount');
    %h1=hist(wordMap,dictionarySize);
    h1 = histogram(wordMap,dictionarySize);
    
    
    h=transpose(h1.Values);
	%assert(numel(h) == dictionarySize);
    
   
   %h=[h1;h1;h];
   
end