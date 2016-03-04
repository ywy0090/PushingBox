function [action1, action2]= ...
    selectTeamAct(q, stateId, numActions, currentA1, currentA2)
action1 = currentA1;
action2 = currentA2;
sub_q = unique(q(stateId,:));
[i_size, j_size] = size(sub_q);
if(i_size == 1 && j_size == 1)
    action1 = ceil(rand*numActions);
    action2 = ceil(rand*numActions);
end

end