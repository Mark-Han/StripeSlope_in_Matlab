clear all
close all
    arrk=0;
for (i=270:300),
    [A,map]=imread('10996.gif','frames',i);
    % figure,imshow(A) 
    % figure,imshow(A,map);  
    imwrite(A,map,'AA.jpg');  
    % figure,imshow('AA.jpg')
    AA=imread('AA.jpg');    
    A1=rgb2gray(AA);
    % figure,imshow(A1);
    f1=im2double(A1);
    level = 1.28*graythresh(f1);
    s1=im2bw(f1,level);
    BW3=s1(100:600,200:750);
    % figure,imshow(BW3);
    [H,the,rho]=hough(BW3);
    P=houghpeaks(H,3,'threshold',ceil(0.5*max(H(:))));
    lines=houghlines(BW3,the,rho,P,'MinLength',500,'FillGap',200);
    figure, imshow(BW3), hold on
    % max_len = 0;
    for k = 1:length(lines)
        xy = [lines(k).point1; lines(k).point2];
        plot(xy(:,1),xy(:,2),'LineWidth',4,'Color','green');
    end
    % if i<362
    %     seq=10500+10*i;
    % elseif i>361
    %     seq=19970+50*(i-361);
    % end
    if i<389
        seq=9120+10*(i-1);
    elseif i>388
        seq=19970+50*(i-389);
    end

    fname=strcat(num2str(seq),'.png');
    % imwrite(BW3,fname),hold on
    %http://stackoverflow.com/questions/1848176/how-do-i-save-a-plotted-image-and-maintain-the-original-image-size-in-matlab
    f = getframe(gcf); 
    imwrite(f.cdata,fname);
    close
    % n=length(lines);
    for i=1:length(lines)
        y1(i)=lines(:,i).point1(2);
        y2(i)=lines(:,i).point2(2);
        x1(i)=lines(:,i).point1(1);
        x2(i)=lines(:,i).point2(1);
    end
    x=x2-x1;
    y=y2-y1;
    k=y./x;
    kmean=mean(k);
    kmean=atan(kmean)*180/pi
    arrk=[arrk,kmean];
end
save  kk10996  arrk '-ascii'