filterbank=createFilterBank();

img=imread('..\data\art_gallery\sun_akdxvnqeibphzzfu.jpg');
img2=imread('..\data\garden\sun_bcsacwamehhbfpef.jpg');
img3=imread('..\data\tennis_court\sun_bzbaifnovkzxbkxd.jpg');
%figure;
%imshow(img);
%load('../data/art_gallery/sun_akdxvnqeibphzzfu.mat');
dictionarySize=200;

% to show montage of the filtered responses of an image
%filterResponses=extractFilterResponses(img,filterbank);
%zImg=reshape(filterResponses, [size(filterResponses,1), size(filterResponses,2), 3,size(filterResponses,3)/3]);
%collage=montage(zImg);

%computeDictionary();
%[fb,dict]=getFilterBankAndDictionary('..\data\library\sun_bikkrgtvixmjwoas.jpg');
%load('dictionary.mat');
%wordMap=getVisualWords(img, filterBank, dictionary);
%disp(wordMap);

%imagesc(wordMap);
%wordMap2=getVisualWords(img2,filterBank,dictionary);
%imagesc(wordMap2);
%wordMap3=getVisualWords(img3,filterBank, dictionary);
%imagesc(wordMap3);
%batchToVisualWords();
%figure;
%imageHist=getImageFeatures(wordMap,dictionarySize);
%figure;
%plot(imageHist);
%imageHist1=getImageFeaturesSPM(3,wordMap,dictionarySize);
%figure;
%plot(imageHist1);

%buildRecognitionSystem();
%bar(imageHist1,'histc');
%disp(h);

abc=guessImage('..\data\art_gallery\sun_adezqftpzhvzscpp.jpg');
%disp(strcmp(abc,'mountain'));
%yet to run this code
%the dictionary size is 160x 60
%do we need to transpose it again to change it further?
%also how to improve accuracy and write up
conf=evaluateRecognitionSystem();
disp(conf);
accurracy=trace(conf)/sum(conf(:)) * 100;
disp(accurracy);