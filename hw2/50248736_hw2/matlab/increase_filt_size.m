function [filtered_scale_space,sigma_array]=increase_filt_size(imgray,k,sigma,N)


[h,w]=size(imgray);
sigma_array=zeros(1,N);
scale_space = zeros(h,w,N);
%filtered_scale_space = zeros(h,w,N);

for i=1:N
    k1=k^(i-1);
   % disp(k1);
    sigma1=sigma*k1;
    %disp(sigma1);
    sigma_array(i)=sigma1;
    %filt_size = ceil(10*sigma1);
    filt_size =  2*ceil(3*sigma1)+1; % filter size
    LoG       =  ((sigma1)^2) * fspecial('log', filt_size, sigma1);
    %disp(LoG);
    imFiltered = imfilter(imgray, LoG, 'same', 'replicate');
    %imFiltered = imfilter(imgray, LoG);

    scale_space(:,:,i)=imFiltered.*imFiltered;
    
end
    filtered_scale_space=scale_space;
end