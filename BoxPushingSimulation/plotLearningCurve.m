function plotLearningCurve()
%  [q1, q2, ep_steps1] = singleQ(2000,2000);
% 
%  xlabel('Training Process');
%  ylabel('Steps');
%  title('SingleQ and Team Pushing Box Learning Curve(1k)','FontSize',12)
[q, ep_steps2, succ_times] = teamQ(1000, 2000);
% plot(mean(reshape(ep_steps(1:1000), 1000, 1)));
plot(ep_steps2(1:1000));
%  plot(mean(reshape(ep_steps1(1:2000), 100, 20)));
%  hold on;
%  plot(mean(reshape(ep_steps2(1:2000), 100, 20)),'r');
% legend('Single Q','Team Q');
% xlabel('Training Process');
% ylabel('Steps');
% title('TeamQ Pushing Box Learning Curve(1k)','FontSize',12)