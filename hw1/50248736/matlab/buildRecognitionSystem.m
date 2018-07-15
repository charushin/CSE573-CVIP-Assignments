function buildRecognitionSystem()
% Creates vision.mat. Generates training features for all of the training images.

	load('dictionary.mat');
	load('../data/traintest.mat');
    %filterBank  = createFilterBank();
    h=[];
    dictionarySize=size(dictionary,1);

	% TODO create train_features
    l = length(train_imagenames);
    for i=1:l
        wordMapName=strcat('../data/',strrep(train_imagenames{i},'.jpg','.mat'));
        disp(i);
        
        wordMap=load(wordMapName);
        wordMap=wordMap.wordMap;
        %disp(wordMap);
        h1=getImageFeaturesSPM(3, wordMap, dictionarySize);
        h=cat(2,h,h1);
    end
    train_features=h;
	save('vision.mat', 'filterBank', 'dictionary', 'train_features', 'train_labels');

end