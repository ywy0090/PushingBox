function [handle_trj]=plotTrajectory(boxPosition, steps)
boxLength = 1;
boxWidth = 1;
xmin = 0;
xmax = 20;
ymin = 0;
ymax = 20;
%%
handle_trj =figure(2);
axis([0 xmax+1 0 ymax+1]);
hold on;
for i=1:steps
    plot_box =boxPosition(i,1:2);
    viscircles([plot_box(1),plot_box(2)]+[boxLength/2,boxWidth/2], 0.1);
end
rectangle('Position',[plot_box(1,1) plot_box(1,2) boxLength boxWidth]);
rectangle('Position',[boxPosition(1,1) boxPosition(1,2) boxLength boxWidth]);
plot(boxPosition(1:steps,1)+boxLength/2,boxPosition(1:steps,2)+boxWidth/2,'--');
%%
 axis square;
hold off;  
end