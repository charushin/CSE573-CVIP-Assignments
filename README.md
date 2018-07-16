# CSE573-CVIP-Assignments
This repository contains all of my implementations for the 573 course assignments.

## Homework 1
### Spatial Pyramid Matching for Scene Classification
•	In this project, I implemented a scene classification system using ‘bag of words’ approach with spatial pyramid extension.
•	Extracted filter responses of an image, and created a dictionary of visual words by applying k-means clustering
•	Computed histograms of the wordmaps and used them to build a recognition system that identifies the scene present in the image
•	Implemented Spatial Pyramid Matching Scheme to improve the accuracy of identification of the scenes.

## Homework 2
### Scale Space Blob Detection
•	Implementation of Laplacian blob detector using Laplacian of Gaussian Filters in MATLAB.
•	Implemented a Laplacian scale space by applying Laplacian of Gaussian filter to images at varying scale.
•	Performed non-maximum suppression in scale space to get the center of blobs which are the values in the scale space where maximum filter response occurred.
•	Constructed the blobs with identified blob centers and radius.

## Homework 3
### Homography and fundamental matrix estimation
• In this project, we had to perform image stitiching between two imah
• Transformed one image with homography matrix and stitched it with the other image to form a panorama of the scene.
• Estimated the fundamental matrix of the camera with the given ground truth matches of two provided images using both normalized and unnormalized algorithms.
• Estimated the fundamental matrix using the extracted matching feature points from two images with RANSAC Algorithm.
• Compared the accuracy of the methods using epipoles and epipolar lines.
• From the point pairs and the given camera matrices the camera center was identified

## Homework 4
### Digit Classification using Autoencoders
•	Studied the working and performance of Sparse Autoencoders using MATLAB’s Tutorial on Autoencoders to classify synthetically generated images of digits.
•	Tuned hyperparameters to improve the performance of the autoencoder classification network.
•	Used the network to classify images from MNIST Handwritten images database and commented on generalization
