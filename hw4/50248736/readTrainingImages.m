function [trainImages, trainLabels]=readTrainingImages()
% Reading pixels from training binary files
trainImg = fopen('train-images.idx3-ubyte','r','b');
[MagicNumber,count]=fread(trainImg,1,'int32');
nImages= fread(trainImg,1,'int32');% Read the number of images
nRows= fread(trainImg,1,'int32');% Read the number of rows in each image
nCols= fread(trainImg,1,'int32');% Read the number of columns in each image
fseek(trainImg,16,'bof');

trainImages=cell(1,nImages);
  for j=1:nImages
      disp(j);
      img= fread(trainImg,28*28,'uchar');
      img2=zeros(28,28);
    for i=1:28
        img2(i,:)=img((i-1)*28+1:i*28);
    end
        img1(:,:)=img2(5:24,5:24);%fig.2
        img=img1./255;
        trainImages{j}=img;
  end

% 
% 
% %reading label
trainlbl = fopen('train-labels.idx1-ubyte','r','b'); % first we have to open the binary file
MagicNumber=fread(trainlbl,1,'int32')
%MagicNumber =
% % 2049
nLabels= fread(trainlbl,1,'int32')% Read the number of labels
% % nLabels=
% % 60000
% %Directly from [2] we know the first label is stored in 8th byte of file in unsigned byte format:
fseek(trainlbl,8,'bof');
labels=fread(trainlbl,nImages,'uchar');
%labels=labels';

trainLabels=zeros(10,nImages);
for i=1:nImages
    j=labels(i);
    if j==0
        j=10;
    end
    trainLabels(j,i)=1;
end
