clear all
close all
    arrk=0;
for (i=10:56),
    [A,map]=imread('C:\Users\DELL\Desktop\015head.gif','frames',i); 
    imwrite(A,map,'AA.jpg');  
    AA=imread('AA.jpg');    
    A1=rgb2gray(AA);
    f1=im2double(A1);
    level = 1.5*graythresh(f1);
    s1=im2bw(f1,level);
    BW3=s1(100:600,200:750);
    [H,the,rho]=hough(BW3);
    P=houghpeaks(H,3,'threshold',ceil(0.5*max(H(:))));
    lines=houghlines(BW3,the,rho,P,'MinLength',500,'FillGap',200);
    figure, imshow(BW3), hold on

    for k = 1:length(lines)
        xy = [lines(k).point1; lines(k).point2];
        plot(xy(:,1),xy(:,2),'LineWidth',4,'Color','green');
    end

    % if i<389
    %     seq=9120+10*(i-1);
    % elseif i>388
    %     seq=19970+50*(i-389);
    % end

    seq=13100+10*(i-1);
    fname=strcat(num2str(seq),'.png');
    f = getframe(gcf); 
    imwrite(f.cdata,fname);
    close
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