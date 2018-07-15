function main(img,sigma,N,threshold,k,method)
%% main function to call
%% img: the relative path to the image
%% im=imread('../data/sunflowers.jpg');
%% sigma
%% N: number of levels in the scale space
%% k: scaling factor
%% method: options are 1- increasing filter size and 2- downsampling image

im=imread(img);
imgray=rgb2gray(im);
imgray=im2double(imgray);
imshow(imgray);



tic
timerVal=tic;
if method==1
    [filtered_scale_space,sigma_array]=increase_filt_size(imgray,k,sigma,N);
elseif method==2
    [filtered_scale_space,sigma_array]=downsample_image(imgray,k,sigma,N);
else
     disp('Please enter either 1 or 2');
     return;
end
toc(timerVal)
%[filtered_scale_space,sigma_array]=change_kernel_size(imgray,k,sigma,N);
%[filtered_scale_space,sigma_array]=downsample_image(imgray,k,sigma,N);


[max_scale_space, max_values]=max(filtered_scale_space,[],3);
for i=1:size(max_scale_space,1)
    for j=1:size(max_scale_space,2)
        if(max_scale_space(i,j)==0)
            max_values(i,j)=0;
        end
    end
end
max_scale_space_filtered=nonMaximum(max_scale_space);

[row,column]=find(max_scale_space_filtered>threshold);
v1=find(max_scale_space_filtered>threshold);
val=max_scale_space_filtered(v1);
op=zeros();
%disp(max_scale_space_initial);
%disp('------------------------------');
%disp(sigma_values_initial);
for j=1:size(val,1)
    [x,y]=find(max_scale_space_filtered==val(j));
    for i=1:size(x)
        op(x(i),y(i))=sigma_array(max_values(x(i),y(i)));
    end
end
v2=find(op);
v=op(v2);
 v=v.*sqrt(2);
 show_all_circles(imgray, column, row, v);
 %toc(timerVal)
 
end
 