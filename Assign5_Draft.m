
%1st Assignment

%Feature Extraction 
a1=imgfts('a.jpg')
d1=imgfts('d.jpg')
m1=imgfts('m.jpg')
n1=imgfts('n.jpg')
o1=imgfts('o.jpg')

p1=imgfts('p.jpg')
q1=imgfts('q.jpg')
r1=imgfts('r.jpg')
u1=imgfts('u.jpg')
w1=imgfts('w.jpg')

%C = [A B] Horizontally concatenates them
%C = [A; B] vertically concatenates them

Features=[a1;d1;m1;n1;o1;p1;q1;r1;u1;w1];

Features;
size(Features)

Class=[1*ones(1,80) 2*ones(1,80) 3*ones(1,80) 4*ones(1,80) 5*ones(1,80) 6*ones(1,80) 7*ones(1,80) 8*ones(1,80) 9*ones(1,80) 10*ones(1,80)];
Classes=Class'

D=dist2(Features,Features);
[D_sorted,D_index]=sort(D,2);
Predicted_Classes=Classes(D_index(:,2))

TrueTestClass=[1*ones(1,7) 2*ones(1,7) 3*ones(1,7) 4*ones(1,7) 5*ones(1,7) 6*ones(1,7) 7*ones(1,7) 8*ones(1,7) 9*ones(1,7) 10*ones(1,7)];


load Reorder
TrueTestClass = TrueTestClass (ReorderIndex); 
clear ReorderIndex;
TTrueTestClass = TrueTestClass'

TestFeatures=imgfts('test.jpg')
Dt=dist2(TestFeatures,Features);
[Dt_sorted,Dt_index]=sort(Dt,2);
PredictedTesClass=Classes(Dt_index(:,1))

showcharlabels('test.jpg',PredictedTesClass,[1,2,3,4,5,6,7,8,9,10])

%Normalizing the Features list
mFeatures=bsxfun(@minus,Features,mean(Features));%Normalization-Subtract Mean-Train
sFeatures=bsxfun(@rdivide,mFeatures,std(mFeatures));%Normalization SD Division-Test

%Prediction on the training data
Dn=dist2(sFeatures,sFeatures);
[Dn_sorted,Dn_index]=sort(Dn,2);
Predicted_Classesn=Classes(Dn_index(:,2))

%Normalizing the Test Features list
mTestFeatures=bsxfun(@minus,TestFeatures,mean(TestFeatures));%Normalization-Subtract Mean-Train
sTestFeatures=bsxfun(@rdivide,mTestFeatures,std(mTestFeatures));%Normalization SD Division-Test
size(sTestFeatures)

%Prediction on the testing data
Dtn=dist2(sTestFeatures,sFeatures);
[Dtn_sorted,Dtn_index]=sort(Dtn,2);
PredictedTesClassn=Classes(Dtn_index(:,1))

showcharlabels('test.jpg',PredictedTesClassn,[1,2,3,4,5,6,7,8,9,10])


%Improvement using 5 nearest features rather than 1-Normalized

Predicted_Classes5=Classes(Dn_index(:,2:6));%Claculating K5 nearest
Predicted_Classes5in1=Predicted_Classes5';%Rotation for Calculating mode
Predicted_Classes5in2=mode(Predicted_Classes5in1);%Mode calculation
Predicted_Classesn5=Predicted_Classes5in2';%Rotation to origical state

%Prediction on the testing data-Same mechanism for Test Data
PredictedTesClasses5=Classes(Dtn_index(:,1:5));
PredictedTesClasses5in1=PredictedTesClasses5';
PredictedTesClasses5in2=mode(PredictedTesClasses5in1);
PredictedTesClassesn5=PredictedTesClasses5in2';



%Improvement using 5 nearest features rather than 1-Non_Normalized

%Prediction on the training data
SPredicted_Classes5=Classes(D_index(:,2:6));%Claculating K5 nearest
SPredicted_Classes5in1=SPredicted_Classes5';%Rotation for Calculating mode
SPredicted_Classes5in2=mode(SPredicted_Classes5in1);%Mode calculation
SPredicted_Classesn5=SPredicted_Classes5in2';%Rotation to origical state

%Prediction on the training data-Same mechanism for Test Data
SPredictedTesClasses5=Classes(Dt_index(:,1:5));
SPredictedTesClasses5in1=SPredictedTesClasses5';
SPredictedTesClasses5in2=mode(SPredictedTesClasses5in1);
SPredictedTesClassesn5=SPredictedTesClasses5in2';

showcharlabels('test.jpg',SPredictedTesClassesn5,[1,2,3,4,5,6,7,8,9,10])

%Improvement using imgfts2
a2=imgfts2('a.jpg')
d2=imgfts2('d.jpg')
m2=imgfts2('m.jpg')
n2=imgfts2('n.jpg')
o2=imgfts2('o.jpg')

p2=imgfts2('p.jpg')
q2=imgfts2('q.jpg')
r2=imgfts2('r.jpg')
u2=imgfts2('u.jpg')
w2=imgfts2('w.jpg')

Features2=[a2;d2;m2;n2;o2;p2;q2;r2;u2;w2]
size(Features2)

%Normalizing the Features list
mFeatures2=bsxfun(@minus,Features2,mean(Features2));%Normalization-Subtract Mean-Train
sFeatures2=bsxfun(@rdivide,mFeatures2,std(mFeatures2));%Normalization SD Division-Test

Di2=dist2(sFeatures2,sFeatures2);
[Di2_sorted,Di2_index]=sort(Di2,2);
Predicted_Classesi2=Classes(Di2_index(:,2))

Dti2=dist2(sTestFeatures,sFeatures2);%Data dimension does not match dimension of centres
%[Dti2_sorted,Dti2_index]=sort(Dti2,2);
%PredictedTesClassi2=Classes(Dti2_index(:,1))


showcharlabels('test.jpg',PredictedTesClass,[1,2,3,4,5,6,7,8,9,10])

%Testing Accuracy

%Initial Set
Train_Pred_Initial = (Predicted_Classes==Classes)
sum(Train_Pred_Initial)
Acc_Train_Initial=sum(Train_Pred_Initial)/length(Classes)

Test_Pred_Initial = (PredictedTesClass==TTrueTestClass)
sum(Test_Pred_Initial)
Acc_Test_Initial=sum(Test_Pred_Initial)/length(TTrueTestClass)


%After Normalization
Train_Pred_K5 = (Predicted_Classesn==Classes)
sum(Train_Pred_K5)
Acc_Train_K5=sum(Train_Pred_K5)/length(Classes)

Test_Pred_K5 = (PredictedTesClassn==TTrueTestClass)
sum(Test_Pred_K5)
Acc_Test_K5=sum(Test_Pred_K5)/length(TTrueTestClass)


%5 Nearest Neighbor-Calculated in excel
Train_Pred_Norm = (Predicted_Classesn5==Classes)
sum(Train_Pred_Norm)
Acc_Train_Norm=sum(Train_Pred_Norm)/length(Classes)

Test_Pred_Norm = (PredictedTesClassesn5==TTrueTestClass)
sum(Test_Pred_Norm)
Acc_Test_Norm=sum(Test_Pred_Norm)/length(TTrueTestClass)


% Using Imgfts2
Train_Pred_i2 = (Predicted_Classesi2==Classes);
sum(Train_Pred_i2)
Acc_Train_Initial=sum(Train_Pred_i2)/length(Classes)

%Throws a dimentionality error Dont know how to solve
%Test_Pred_i2 = (PredictedTesClassi2==TTrueTestClass)
%sum(Test_Pred_i2)
%Acc_Test_i2=sum(Test_Pred_i2)/length(TTrueTestClass)



% SPAM Classification


ttrain_data=train_data'%Data Transpose

mtrain_data=bsxfun(@minus,ttrain_data,mean(ttrain_data));%Normalization-Subtract Mean-Train
strain_data=bsxfun(@rdivide,mtrain_data,std(ttrain_data));%Normalization SD Division-Train
sp = categorical(ytrain);%categorizing Test Outputs
Isp=sp'%Inverting the Training Output 
[B,dev,stats] = mnrfit(strain_data,Isp)
Train_predict = mnrval(B,strain_data)

ttest_data=test_data'

mtest_data=bsxfun(@minus,ttest_data,mean(ttrain_data));%Normalization-Subtract Mean-Test
stest_data=bsxfun(@rdivide,mtest_data,std(ttrain_data));%Normalization SD Division-Test



Tesp = categorical(ytest);%categorizing Test Outputs
TeIsp=Tesp'%Inverting the Test Output 

Train_predict = mnrval(B,strain_data)%Running model on Training data
Test_predict = mnrval(B,stest_data)%Running model on Test data

% Naive Bayes
NBModel = fitNaiveBayes(strain_data,Isp)
NBModel.ClassLevels
NBModel.Params
NBModel.Params{1,2}

NBTrpre = predict(NBModel,strain_data)%Predicting the results using the NBModel on training
NBTepre = predict(NBModel,stest_data)%Predicting the results using the NBModel on test

% SVM
smoopt=svmsmoset('Maxiter',50000);
svm=svmtrain(strain_data,Isp,'autoscale','false','Method','SMO','SMO_Opts' ,smoopt);

STrPre=svmclassify(svm,strain_data)
STePre=svmclassify(svm,stest_data)

%Testing Accuracy
%Logistic Regression-Calculated in Excel


%Naive Bayes Regression
Train_Pred_NB = (Isp==NBTrpre)
sum(Train_Pred_NB)
Pred_Tr_NB=sum(Train_Pred_NB)/length(Isp)

Test_Pred_NB = (TeIsp==NBTepre)
sum(Test_Pred_NB)
Pred_Te_NB=sum(Test_Pred_NB)/length(TeIsp)

%SVM Regression
Train_Pred_SVM = (Isp==STrPre)
sum(Train_Pred_SVM)
Pred_Tr_SVM=sum(Train_Pred_SVM)/length(Isp)

Test_Pred_SVM = (TeIsp==STePre)
sum(Test_Pred_SVM)
Pred_Te_SVM=sum(Test_Pred_SVM)/length(TeIsp)


% Confusion Matrix Calculation
% TP Rate: TP/(TP+FN);FP Rate: FP/(FP+TN);
% Precision: TP/(TP+FP);Recall: =TP/(TP+FN)


