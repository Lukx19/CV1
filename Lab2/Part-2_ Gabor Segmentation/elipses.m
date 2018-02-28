figure;
%function [ myGabor ] = createGabor( sigma, theta, lambda, psi, gamma )
%gab = createGabor( 5,pi/8,3,0, 0.5 );
%real = imresize(gab(:,:,1),25);
%imshow(real);

%angles = [pi/8, pi/4 pi/2]
%for p = 1:3 
%    subplot(1,3,p);
%    gab = createGabor( 5,angles(p),3,0, 0.5 );
%    real = imresize(gab(:,:,1),25);
%    imshow(real);
%    title(sprintf('theta = %d',angles(p)));
%end

%sigmas = [0.8, 1 1.7]
%for p = 1:3 
%    subplot(1,3,p);
%    gab = createGabor( sigmas(p),pi/8,3,0, 0.5 );
%    real = imresize(gab(:,:,1),25);
%    imshow(real);
%    title(sprintf('sigma = %d',sigmas(p)));
%end

gamas = [0.3, 1 3]
for p = 1:3 
    subplot(1,3,p);
    gab = createGabor( 5,pi/8,3,0, gamas(p));
    real = imresize(gab(:,:,1),25);
    imshow(real);
    title(sprintf('gamas = %d',gamas(p)));
end


%g = gabor([5 10],[0 90]);
%figure;
%subplot(2,2,1)
%for p = 1:length(g)
%    subplot(2,2,p);
%    imshow(real(g(p).SpatialKernel),[]);
%    lambda = g(p).Wavelength;
%    theta  = g(p).Orientation;
%    sigma
%    title(sprintf('Re[h(x,y)], \\lambda = %d, \\theta = %d',lambda,theta));
%end