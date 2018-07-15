filterbank=createFilterBank();

img=imread('..\data\art_gallery\sun_akdxvnqeibphzzfu.jpg');
img2=imread('..\data\garden\sun_bcsacwamehhbfpef.jpg');
img3=imread('..\data\tennis_court\sun_bzbaifnovkzxbkxd.jpg');
%figure;
%imshow(img);



% Q 1.1 to show montage of the filtered responses of an image
%filterResponses=extractFilterResponses(img,filterbank);
zImg=reshape(filterResponses, [size(filterResponses,1), size(filterResponses,2), 3,size(filterResponses,3)/3]);
collage=montage(zImg);

% Q 1.2to create dictionary and store it in dictionary.mat
%computeDictionary();

%load('dictionary.mat');

% to compute the word maps of all images in traintest.mat
%batchToVisualWords();

% Q 1.3 to visualize three wordmaps
wordMap=getVisualWords(img, filterBank, dictionary);
imagesc(wordMap);
wordMap2=getVisualWords(img2,filterBank,dictionary);
imagesc(wordMap2);
wordMap3=getVisualWords(img3,filterBank, dictionary);
imagesc(wordMap3);

% Q 2.1
%imageHist=getImageFeatures(wordMap,dictionarySize);
%figure;
%plot(imageHist);

% Q 2.2
%imageHist1=getImageFeaturesSPM(3,wordMap,dictionarySize);
%figure;
%plot(imageHist1);

% Q 2.4 to build recognition system to produce vision.mat
%buildRecognitionSystem();


%abc=guessImage('..\data\garden\sun_ajowzxcvvebmbgum.jpg');
%disp(strcmp(abc,'mountain'));

% Q 2.5 to calculate confusion matrix and accurracy
conf=evaluateRecognitionSystem();
disp(conf);
accurracy=trace(conf)/sum(conf(:)) * 100;
disp(accurracy);