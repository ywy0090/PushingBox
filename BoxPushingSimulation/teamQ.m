function [q, epSteps, succ_times] = teamQ(episodes, threshold)
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
q = zeros(num_states, numActions, numActions);

sub_q = zeros(numActions, numActions);
succ_times = 0;
%threshold = 100;
%plot infor
epSteps = zeros(10000,1);
plotBox = zeros([5000,2]);
plotAction1 = zeros([5000,1]);
plotAction2 = zeros([5000,1]);
%save
filename = 'qTable.mat';
teamPlotFile = 'TeamPlottingInf.mat';
%load(filename, 'q', 'steps');
%optimalStep = steps;
optimalStep = 20;
%
initPos = [2,2];
dest = [10,6];
for i=1:episodes,
    [currentA1, currentA2, nextPosition, stateId, absorb]= ...
    singleStep( initPos, 1, 1, dest);
%choose max element from the Q cube 
    [maxq, index] = max(q(stateId,:));
    sub_q = reshape(q(stateId,:), numActions, numActions);
     [currentA1, currentA2] = ind2sub(size(sub_q),index);
    %qTable, stateId, numAction, currentAction
    [currentA1, currentA2] = ... 
    selectTeamAct(q, stateId, numActions, currentA1, currentA2);
    steps = 0;
    while(~absorb)
       [currentA1, currentA2, nextPosition, stateId_new, absorb]= ...
    singleStep( nextPosition, currentA1, currentA2, dest);
        %reward = -double(absorb == 0);
        distance = nextPosition-dest;
        reward = (-1)*(norm(distance));
    % find the best action for the next state and update q value
       [maxq, index] = max(q(stateId,:));
       sub_q = reshape(q(stateId,:), numActions, numActions);
       [an1, an2] =  ind2sub(size(sub_q),index);
       %
       [an1, an2] = selectTeamAct(q, stateId_new, numActions, an1, an2);

       [an1, an2] = randomTeamSelect(sub_q, maxq, an1, an2);
       
       %avoid contradictions 
       %[an1, an2] = avoidTeamCd(currentA1, currentA2, an1, an2, numActions);
        [an1, an2] = avoidContrd(an1, an2, numActions);
        %
         q(stateId, currentA1, currentA2) = ...
         (1 - alpha)*q(stateId,currentA1, currentA2) ...
         + alpha*(reward + gamma*maxq);
        
        currentA1 = an1;
        currentA2 = an2;
        stateId = stateId_new;
        steps = steps + 1; 
        %
        plotBox(steps,:) = nextPosition;
        plotAction1(steps) = an1;
        plotAction2(steps) = an2;
        %
        if(steps > threshold)
            disp('Not found!');
            break;
        end
    end
    epSteps(i) = steps;
    if(steps <= threshold)
        disp('Found one solution!');
        disp(steps);
        if(steps < optimalStep)
            clf;
            for i=1:1:steps
            plotSingleStep(plotBox(i,:), plotAction1(steps), plotAction2(steps));
            end
        optimalStep = steps;    
        save(teamPlotFile, 'plotBox', 'plotAction1', 'plotAction2');
        save(filename, 'q', 'steps');
        end
    end
    disp(i);
     if(absorb)
        succ_times = succ_times+1;
    end
end



end