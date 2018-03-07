function tracking(directory, image1, window_size)
    % Input: the directory of the set of images
    % open files
    files = dir(strcat(directory,'*.jpg'));
    if(isempty(files))
        files = dir(strcat(directory,'*.jpeg'));
    end
    files = files(2:end);

    %the video directory.
     output_images = strcat('output_images_', directory);
     display(output_images)
     if exist(output_images,'dir')
         rmdir(output_images, 's')
     end
     mkdir(output_images)
    
     [~, r, c] = harris_corner_detector(image1);

    for file = files'
        % use the lucas kanade algorithm to calculate the velocity and the new corners.
        image2 = rgb2gray(imread(strcat(directory,file.name)));
        [r, c] = lucas_kanade(image1, image2, window_size,r, c, strcat(output_images,file.name));
        image1 = image2;
    end

    % video writer to build the video by using processed images.
    %video_name = strcat(directory,"video.avi");
    outputVideo = VideoWriter(fullfile(output_images,'video.avi'));
    open(outputVideo);
    % Iterate over the images that can be used for a video.
    o_files = dir(strcat(output_images,'*.jpg'));
    if(isempty(o_files))
        o_files = dir(strcat(output_images,'*.jpeg'));
    end
    for file = o_files'
        I = imread(strcat(output_images,file.name));
        writeVideo(outputVideo,I);
    end
    close(outputVideo);
    

end