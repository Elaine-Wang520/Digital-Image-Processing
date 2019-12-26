function g = localthresh(f, nhood, a, b, meantype)
%LOCALTHRESH Local threshholding.
% G = LOCALTHRESH(F, NHOOD, A, B, MEANTYPE) threshholds image F by
% computing a local threshold at the center, (x,y), of every neighborhood
% in F. The size of the neighborhoods is defined by NHOOD, an array of
% zeros and ones in which the nonzero elements specify the neighbors used
% in the computation of the local mean and standard deviation. The size of
% NHOOD must the odd in both dimensions.
%
% The segmented image is given by
%
%         1 if (F>A*SIG) AND (F>B*MEAN)
%    G =
%         0 otherwise
%
% where SIG is an array of the same size as F containing the local standard
% deviations. If MEANTYPE = 'local' (the default), then MEAN is an array of
% local means. If MEANTYPE = 'global', then MEAN is the global (image)
% mean, a scalar. Constants A and B are nonnegative scalars.

% Intialize
f = tofloat(f);

% Compute the local standard deviations.
SIG = stdfilt(f, nhood);
% Compute MEAN
if nargin == 5 && strcmp(meantype, 'global')
    MEAN = mean2(f);
else
    MEAN = localmean(f, nhood); %This is a custom function.
end

% Obtain the segmented image.
g = (f > a*SIG) & (f > b*MEAN);