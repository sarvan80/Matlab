%Change Testing
datafinal2 = horzcat(data, cvind)
labels2t=labels.'
labels2final=horzcat(labels2t, cvind)
% Cross validat
for j=1:57
% Test
    
        for i=1:10
            MV = ( datafinal2(:,58)~=i);
            MVL = ( datafinal2(:,58)==i);
            Model = fitcdiscr(datafinal2(MV,j),labels2final(MV,1))
            meanclass1 = predict(Model,datafinal2(MVL,j))
            cp = classperf(labels2final(MVL,1),meanclass1);
            CR(i)=cp.CorrectRate
        end
        CRT(j)=sum(CR)/10
end
[B,I] = sort(CRT,'descend')% Figuring out the order of the Highest Accuracy
I(1)%Best positional variable

h=1
% 2 Variables
clear CRT
h2=0
for j=2:57
    for i=1:10
        MV = ( datafinal2(:,58)~=i);
        MVL = ( datafinal2(:,58)==i);
        Model = fitcdiscr(datafinal2(MV,[I(1) I(j)]),labels2final(MV,1))
        meanclass1 = predict(Model,datafinal2(MVL,[I(1) I(j)]))
        cp = classperf(labels2final(MVL,1),meanclass1);
        CR(i)=cp.CorrectRate
    end
    CRT(j)=sum(CR)/10
    if(CRT(j)>CRT(j-1)+.009)
        h2=j;
        P2=CRT(j);
    else
        break;
    end    
end

% 3 Variables
clear CRT
h3=0
for j=3:57
    for i=1:10
        MV = ( datafinal2(:,58)~=i);
        MVL = ( datafinal2(:,58)==i);
        Model = fitcdiscr(datafinal2(MV,[I(1) I(h2) I(j)]),labels2final(MV,1))
        meanclass1 = predict(Model,datafinal2(MVL,[I(1) I(h2) I(j)]))
        cp = classperf(labels2final(MVL,1),meanclass1);
        CR(i)=cp.CorrectRate
    end
    CRT(j)=sum(CR)/10
    if(CRT(j)>CRT(j-1)+.009)
        h3=j;
        P3=CRT(j);
    else
        break;
    end    
end

% 4 Variables
clear CRT
h4=0
for j=4:57
    for i=1:10
        MV = ( datafinal2(:,58)~=i);
        MVL = ( datafinal2(:,58)==i);
        Model = fitcdiscr(datafinal2(MV,[I(1) I(h2) I(h3) I(j)]),labels2final(MV,1))
        meanclass1 = predict(Model,datafinal2(MVL,[I(1) I(h2) I(h3) I(j)]))
        cp = classperf(labels2final(MVL,1),meanclass1);
        CR(i)=cp.CorrectRate
    end
    CRT(j)=sum(CR)/10
    if(CRT(j)>CRT(j-1)+.009)
        h4=j;
        P4=CRT(j);
    else
        break;
    end

        
end

% 5 Variables
clear CRT
h5=0
for j=5:57
    for i=1:10
        MV = ( datafinal2(:,58)~=i);
        MVL = ( datafinal2(:,58)==i);
        Model = fitcdiscr(datafinal2(MV,[I(1) I(h2) I(h3) I(h4) I(j)]),labels2final(MV,1))
        meanclass1 = predict(Model,datafinal2(MVL,[I(1) I(h2) I(h3) I(h4) I(j)]))
        cp = classperf(labels2final(MVL,1),meanclass1);
        CR(i)=cp.CorrectRate
    end
    CRT(j)=sum(CR)/10
    if(CRT(j)>CRT(j-1)+.01)
        h5=j;
        P5=CRT(j);
    else
        break;
    end     
end

% 6 Variables
clear CRT
h6=0
for j=6:57
    for i=1:10
        MV = ( datafinal2(:,58)~=i);
        MVL = ( datafinal2(:,58)==i);
        Model = fitcdiscr(datafinal2(MV,[I(1) I(h2) I(h3) I(h4) I(h5) I(j)]),labels2final(MV,1))
        meanclass1 = predict(Model,datafinal2(MVL,[I(1) I(h2) I(h3) I(h4) I(h5) I(j)]))
        cp = classperf(labels2final(MVL,1),meanclass1);
        CR(i)=cp.CorrectRate
    end
    CRT(j)=sum(CR)/10
    if(CRT(j)>CRT(j-1)+.005)
        h6=j;
        P6=CRT(j);
    else
        break;
    end
        
end


% 7 Variables
clear CRT
h7=0
for j=7:57
    for i=1:10
        MV = ( datafinal2(:,58)~=i);
        MVL = ( datafinal2(:,58)==i);
        Model = fitcdiscr(datafinal2(MV,[I(1) I(h2) I(h3) I(h4) I(h5) I(h6) I(j)]),labels2final(MV,1))
        meanclass1 = predict(Model,datafinal2(MVL,[I(1) I(h2) I(h3) I(h4) I(h5) I(h6) I(j)]))
        cp = classperf(labels2final(MVL,1),meanclass1);
        CR(i)=cp.CorrectRate
    end
    CRT(j)=sum(CR)/10
    if(CRT(j)>CRT(j-1)+.005)
        h7=j;
        P7=CRT(j);
    else
        break;
    end
        
end


% 8 Variables
clear CRT
h8=0
for j=8:57
    for i=1:10
        MV = ( datafinal2(:,58)~=i);
        MVL = ( datafinal2(:,58)==i);
        Model = fitcdiscr(datafinal2(MV,[I(1) I(h2) I(h3) I(h4) I(h5) I(h6) I(h7) I(j)]),labels2final(MV,1))
        meanclass1 = predict(Model,datafinal2(MVL,[I(1) I(h2) I(h3) I(h4) I(h5) I(h6) I(h7) I(j)]))
        cp = classperf(labels2final(MVL,1),meanclass1);
        CR(i)=cp.CorrectRate
    end
    CRT(j)=sum(CR)/10
    if(CRT(j)>CRT(j-1)+.005)
        h8=j;
        P8=CRT(j);
    else
        break;
    end
        
end

% 9 Variables
clear CRT
h9=0
for j=9:57
    for i=1:10
        MV = ( datafinal2(:,58)~=i);
        MVL = ( datafinal2(:,58)==i);
        Model = fitcdiscr(datafinal2(MV,[I(1) I(h2) I(h3) I(h4) I(h5) I(h6) I(h7) I(h8) I(j)]),labels2final(MV,1))
        meanclass1 = predict(Model,datafinal2(MVL,[I(1) I(h2) I(h3) I(h4) I(h5) I(h6) I(h7) I(h8) I(j)]))
        cp = classperf(labels2final(MVL,1),meanclass1);
        CR(i)=cp.CorrectRate
    end
    CRT(j)=sum(CR)/10
    if(CRT(j)>CRT(j-1)+.005)
        h9=j;
        P9=CRT(j);
    else
        break;
    end
        
end
