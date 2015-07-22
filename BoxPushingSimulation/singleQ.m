function [q1,q2] = singleQ(episodes)
alpha = 0.05;
gamma = 0.99;
%num_states 20*20+20+1
%In x and y directions, each of them has 20 discrete states 
xmax = 20;
ymax = 20;
num_states = xmax*ymax+xmax+1;
numActions = 4;
%action 1-right 2-left 3-up 4-down
%actions = [1,2,3,4];
q1 = zeros(num_states, numActions);
q2 = zeros(num_states, numActions);
%
filename = 'singleQTable.mat';
singlePlotFile = 'SinglePlottingInf.mat';
%plot infor
plotBox = zeros([5000,2]);
optimalStep = 1000;
initPos = [4,4];
dest = [10,10];
for i=1:episodes,
    [currentA1, currentA2, nextPosition, stateId, absorb]= ...
    singleStep( initPos, 1, 1, dest);
    [maxq1, currentA1] = max(q1(stateId,:));
    [maxq2, currentA2] = max(q1(stateId,:));
    %qTable, stateId, numAction, currentAction
    currentA1 = selectAction(q1, stateId, numActions, currentA1);
    currentA2 = selectAction(q2, stateId, numActions, currentA2);
    steps = 0;
    while(~absorb)
        [currentA1, currentA2, nextPosition, stateId_new, absorb]= ...
    singleStep( nextPosition, currentA1, currentA2, dest);
        reward = -double(absorb == 0);
    
    % find the best action for the next state and update q value
        [maxq1, an1] = max(q1(stateId_new,:));
        [maxq2, an2] = max(q2(stateId_new,:));
        an1 = selectAction(q1, stateId_new, numActions, an1);
        an2 = selectAction(q2, stateId_new, numActions, an2);
       %avoid contradictions 
        [an1, an2] = avoidContrd(an1, an2, numActions);
        %
         q1(stateId,currentA1) = (1 - alpha)*q1(stateId,currentA1) + ...
        alpha*(reward + gamma*maxq1);
        q2(stateId,currentA2) = (1 - alpha)*q2(stateId,currentA2) + ...
        alpha*(reward + gamma*maxq2);
        
        currentA1 = an1;
        currentA2 = an2;
        stateId = stateId_new;
        steps = steps + 1;
        
        plotBox(steps,:) = nextPosition;
    end
    %
    if(steps <= 100)
        disp('Found one solution!');
        disp(steps);
         
        if(steps < optimalStep)
            clf;
            for i=1:1:steps
            plotSingleStep(plotBox(i,:), 1, 1);
            end
        optimalStep = steps;    
        save(singlePlotFile, 'plotBox', 'optimalStep');
       
        end
    end
    %
    disp(steps);
end
end