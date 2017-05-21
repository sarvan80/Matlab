% % % % % % % % % % % % % % % %Logistic Regresssion CV 10 Folds % % % % % % % % % % %
% 
% % % % % % % % % % Training set Accuracy % % % % % % %
Model = mnrfit(Consumatedata1(:,1:8),RConsumatelabel1(:,1))

probM = mnrval(Model,Consumatedata1(:,1:8))

    % % % % % % % Constructing Prediction Class % % % % % 
    for i1=1:length(probM)
      if(probM(i1,1)<0.5)
          PredM(i1)=2;
      else
          PredM(i1)=1;
       end
     end 
     meanclassM=PredM.'

     Mp = classperf(RConsumatelabel1(:,1),meanclassM);
     MR = Mp.CorrectRate
     MSe= Mp.Sensitivity
     Msp= Mp.Specificity
     
% % % % % % % % % 10 Fold Cross Validation % % % % % % %
for i=1:10
    MV1 = (Consumatedata1(:,9)~=i);
    MVL1 = (Consumatedata1(:,9)==i);

   % % % % % % % %Model Building % % % % % % % %

    Model = mnrfit(Consumatedata1(MV1,1:8),RConsumatelabel1(MV1,1))
    prob = mnrval(Model,Consumatedata1(MVL1,1:8))

    % % % % % % % Constructing Prediction Class % % % % % 
    for i1=1:length(prob)
      if(prob(i1,1)<0.5)
          Pred(i1)=2;
      else
          Pred(i1)=1;
       end
     end 
     meanclass1=Pred.'

     cp = classperf(RConsumatelabel1(MVL1,1),meanclass1);
     CR(i)=cp.CorrectRate
     CSe(i)=cp.Sensitivity
     CSp(i)=cp.Specificity
end
% % % % % % % % % Overall Accuracy on 10 Fold CV % % % % % % %
CRT=sum(CR)/10
CSeT=sum(CSe)/10
CSpT=sum(CSp)/10