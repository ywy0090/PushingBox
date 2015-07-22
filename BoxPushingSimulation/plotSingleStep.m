function plotSingleStep(boxPosition, action1, action2)
%agent 1's action, agent 2's action
%box position, agents position
%clf;
agentP1 = [0 0];
agentP2 = [0 0];
xmax=20;
ymax=20;
boxsize=1;
%compute agents' position
%action 1-right 2-left 3-up 4-down
if (action1 == 1)
    agentP1(1) = boxPosition(1)-((boxsize/2)+0.5);
    agentP1(2) = boxPosition(2);
elseif (action1 == 2)
    agentP1(1) = boxPosition(1)+((boxsize/2)+0.5);
    agentP1(2) = boxPosition(2);
elseif (action1 == 3)
    agentP1(2) = boxPosition(2)-((boxsize/2)+0.5);
    agentP1(1) = boxPosition(1);
elseif (action1 == 4)
    agentP1(1) = boxPosition(1);
    agentP1(2) = boxPosition(2)+((boxsize/2)+0.5);
end
if (action2 == 1)
    agentP2(1) = boxPosition(1)-((boxsize/2)+0.5);
    agentP2(2) = boxPosition(2);
elseif (action2 == 2)
    agentP2(1) = boxPosition(1)+((boxsize/2)+0.5);
    agentP2(2) = boxPosition(2);
elseif (action2 == 3)
    agentP2(1) = boxPosition(1);
    agentP2(2) = boxPosition(2)-((boxsize/2)+0.5);
elseif (action2 == 4)
    agentP2(1) = boxPosition(1);
    agentP2(2) = boxPosition(2)+((boxsize/2)+0.5);
end
%plot box and agents
figure(1);
axis([0 xmax+1 0 ymax+1]);
hold on;
plot_box =boxPosition -(boxsize/2);
rectangle('Position',[plot_box(1) plot_box(2) boxsize boxsize]);
%viscircles(agentP1,0.5);
%viscircles(agentP2,0.5);
hold off;
end