
% linearly nonseparable case
linNonsepData =importdata('nonlinsep.txt');
% %%
% new=linNonsepData(:,1).^2+linNonsepData(:,2).^2;
% linNonsepData(:,3)=new;
% %%


% figure;
% scatter3(linNonsepData(:,1),linNonsepData(:,2),linNonsepData(:,3));
% hold on;

Y=linNonsepData(:,3);
X=[linNonsepData(:,1),linNonsepData(:,2)];

%lineTruFalse=1 means linearly separable
%lineTruFalse=0 means linearly unseparable

lineTruFalse=0;
nsSVM(X,Y,lineTruFalse);

