function [currentA1, currentA2, nextPosition, stateId, absorb]= ...
singleStep( boxPosition, action1, action2, dest)
%action1 action of agent1
%action2 action of agent2
%nextPosition position of box
%currentAction executed actions
%action 1-right 2-left 3-up 4-down
currentA1 = action1;
currentA2 = action2;
%boundary
xmax = 20;
xmin = 0;
ymax = 20;
ymin = 0;
%step size
step = 0.5;
%agent1 pushing
if (action1 == 1)
    boxPosition(1)= boxPosition(1)+step;
elseif (action1 == 2)
    boxPosition(1) = boxPosition(1)-step;
elseif (action1 == 3)
    boxPosition(2)= boxPosition(2)+step;
elseif (action1 == 4)
    boxPosition(2)= boxPosition(2)-step;
end
%agent2 pushing
if (action2 == 1)
    boxPosition(1)= boxPosition(1)+step;
elseif (action2 == 2)
    boxPosition(1) = boxPosition(1)-step;
elseif (action2 == 3)
    boxPosition(2)= boxPosition(2)+step;
elseif (action2 == 4)
    boxPosition(2)= boxPosition(2)-step;
end
boxPosition(1)=min(xmax,boxPosition(1));
boxPosition(2)=min(ymax,boxPosition(2));
boxPosition(1)=max(xmin, boxPosition(1));
boxPosition(2)=max(ymin,boxPosition(2));
if(floor(boxPosition(1))== dest(1) && floor(boxPosition(2))==dest(2))
    absorb =1;
else 
    absorb =0;
end
nextPosition = boxPosition;
stateId = round(boxPosition(2))*(ymax)+ round(boxPosition(1))+1;
end