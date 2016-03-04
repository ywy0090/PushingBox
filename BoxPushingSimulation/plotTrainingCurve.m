function plotTrainingCurve()
succ_vector = zeros(10,1);
j=1;
for i=100:100:1000
    %[q1,q2,epSteps, succ_times] = singleQ(2000,i);
    [q, epSteps, succ_times] = teamQ(2000, i);
    succ_vector(j) = succ_times/2000;
    j=j+1;
end
threshold = 100:100:1000;
bar(threshold,succ_vector);
xlabel('Threshold');
ylabel('Successful times');
title('SingleQ Pushing Box Training Curve(2k)','FontSize',12);
end