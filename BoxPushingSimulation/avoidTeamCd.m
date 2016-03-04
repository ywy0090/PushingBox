function [actionNew1,actionNew2] = ...
avoidTeamCd(currentA1, currentA2, nextA1, nextA2, numAction)
actionNew1 = nextA1;
actionNew2 = nextA2;
%action 1-right 2-left 3-up 4-down
flag11 = checkContrd(currentA1, nextA1);
flag12 = checkContrd(currentA2, nextA2);
if(flag11 && flag12)
    actionNew1 = ceil(rand*numAction);
    actionNew2 = ceil(rand*numAction);
end

flag21 = checkContrd(currentA1, nextA2);
flag22 = checkContrd(currentA2, nextA1);
if(flag21 && flag22)
    actionNew1 = ceil(rand*numAction);
    actionNew2 = ceil(rand*numAction);
end
end