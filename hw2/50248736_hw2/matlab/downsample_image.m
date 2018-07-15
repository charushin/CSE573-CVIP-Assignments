function [filtered_scale_space,sigma_array]=downsample_image(imgray, k,sigma,N)

%apply LoG
filt_size =  2*ceil(3*sigma)+1; % filter size
[h,w]=size(imgray);
scale_space=cell(1,N);
img_cell=cell(1,N);
sigma_array=zeros(1,N);
for i=1:N
    %need to multiply by 1/k at each level
    k1=1/(k^(i-1));
    sigma_array(i)=sigma * (k^(i-1));
    new_img=imresize(imgray,[k1*size(imgray,1) k1*size(imgray,2)],'lanczos2');
    img_cell{i}=new_img;
    
    LoG       = ((sigma)^2) * fspecial('log', filt_size, sigma);
    %disp(LoG);
    scale_space{i} = imfilter(new_img, LoG, 'same', 'replicate');
    %imFiltered = imfilter(imgray, LoG);
    
   % scale_space{i}=imFiltered.^2;
   
end

filtered_scale_space=zeros(h,w,N);

%resampling all the images
for i=1:N
    filtered_scale_space(:,:,i)=(imresize(scale_space{i},[h w],'lanczos2')).^2;
end
end
