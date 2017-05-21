% cp = classperf(TestLabel,Class);
% cp.CorrectRate
% Testlabel = predict(MdlLinear,data2(:,[1 3]))
% cp = classperf(meanclass,Testlabel)
% cp.CorrectRate
% MdlLinear = fitcdiscr(data2(:,1:2),labels2)
% meanclass = predict(MdlLinear,data2(:,[1 3]))

% cp = classperf(meanclass,labels2)

% % % % % % % % % % Working code for Indicing % % % % % % % % % 
% i=2
% l(i)=1
% data2(:,[l(i) 3])

% % % % % % % % % % Sorting & Indexing % % % % % % % % % % % %

%l(1)=7
l(2)=1
l(3)=2
l(4)=5
l(5)=3

B = sort(l)
for c = 1:5
    Index(c) = find(l == B(c));
    disp(Index(c));
end    
i=1


data2(:,[Index(i) 3])


%Cross validation
idx1 = ( TA(:,i)~=j);
T_new1 = TA(idx1,:)

% cp = classperf(TrainLabel);
Model = fitcdiscr(T4,m.labels);
% Class = knnclassify(TestVec,TrainVec, TrainLabel);
cp = classperf(TestLabel,Class);
cp.CorrectRate
 
