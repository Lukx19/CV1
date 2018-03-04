function tracking(directory, image1, window_size)
    % Input: the directory of the set of images
    % open files
    files = dir(strcat(directory,'*.jpg'));
    files = files(2:end);

    %the video directory.
     output_images = strcat('output_images_', directory);
    [~, r, c] = harris_corner_detector(image1);

    for file = files'
        % use the lucas kanade algorithm to calculate the velocity and the new corners.
        image2 = rgb2gray(imread(strcat(directory,file.name)));
        [r, c] = lucas_kanade_algorithm(image1, image2, window_size,r, c, strcat(output_images,file.name));
        image1 = image2;
    end

    % video writer to build the video by using processed images.
    %video_name = strcat(directory,"video.avi");
    outputVideo = VideoWriter(fullfile(output_images,'video.avi'));
    open(outputVideo);
    % Iterate over the images that can be used for a video.
    for file = dir(strcat(output_images,'*.jpg'))'
        I = imread(strcat(output_images,file.name));
        writeVideo(outputVideo,I);
    end
    close(outputVideo);
    

end