function [imgB] = nonMaximum(imgA)

%mask = ones(3); mask(5) = 0;
B = ordfilt2(imgA,9,ones(3,3));
out=(imgA==B);

imgB=imgA.*out;

end