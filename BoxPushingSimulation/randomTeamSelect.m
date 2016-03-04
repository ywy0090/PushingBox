function [action1, action2] = ...
randomTeamSelect(sub_q, maxq, action1n, action2n)
action1 = action1n;
action2 = action2n;
indexArray = find(sub_q == maxq);
arraySize = size(indexArray, 1); 
if(arraySize > 1)
    index = ceil(arraySize * rand);
    [action1, action2] = ind2sub(size(sub_q), indexArray(index));
end

end