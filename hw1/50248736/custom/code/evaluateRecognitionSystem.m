function [conf] = evaluateRecognitionSystem()
% Evaluates the recognition system for all test-images and returns the confusion matrix

	load('vision.mat');
	traintest=load('../data/traintest.mat');
    mapping=traintest.mapping;
	% TODO Implement your code here
    test_imagenames=traintest.test_imagenames;
    test_labels=traintest.test_labels;
    l=length(test_imagenames);
    c=0;
    conf_mat=zeros(8,8);
    for i=1:l
        wordMapName=strcat('../data/',test_imagenames{i});
        %wordMap=wordMap.wordMap;
        disp(i);
        guessedImage=guessImage(wordMapName);
        test_index=test_labels(i,1);
        map_value=mapping(test_index);
        if(strcmp(guessedImage,map_value{1})==1)
            disp('classified successfully');
            c=c+1;
        end
        %test_index=find(contains(mapping,test_label));
        guess_index=find(contains(mapping,guessedImage));
        a=conf_mat(test_index,guess_index);
        conf_mat(test_index,guess_index)=a+1;
    end
    disp(c);
    conf=conf_mat;
end