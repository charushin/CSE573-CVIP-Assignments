function [testImages, testLabels]=readTestData()
% Reading pixels from training binary files
testImg = fopen('t10k-images.idx3-ubyte','r','b');
[MagicNumber,count]=fread(testImg,1,'int32');
nImages= fread(testImg,1,'int32');% Read the number of images
nRows= fread(testImg,1,'int32');% Read the number of rows in each image
nCols= fread(testImg,1,'int32');% Read the number of columns in each image
fseek(testImg,16,'bof');

testImages=cell(1,nImages);
  for j=1:nImages
      disp(j);
      img= fread(testImg,28*28,'uchar');
      img2=zeros(28,28);
    for i=1:28
        img2(i,:)=img((i-1)*28+1:i*28);
    end
        img1(:,:)=img2(5:24,5:24);%fig.2
        img=img1./255;
        testImages{j}=img;
  end

% 
% 
% %reading label
testlbl = fopen('t10k-labels.idx1-ubyte','r','b'); % first we have to open the binary file
MagicNumber=fread(testlbl,1,'int32')
%MagicNumber =
% % 2049
nLabels= fread(testlbl,1,'int32')% Read the number of labels
% % nLabels=
% % 60000
% %Directly from [2] we know the first label is stored in 8th byte of file in unsigned byte format:
fseek(testlbl,8,'bof');
labels=fread(testlbl,nImages,'uchar');
%labels=labels';

testLabels=zeros(10,nImages);
for i=1:nImages
    j=labels(i);
    if j==0
        j=10;
    end
    testLabels(j,i)=1;
end
