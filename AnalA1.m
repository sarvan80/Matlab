% vars1 = fieldnames(newData1);
%Variables as iterable field names
%Auto adding the right number of variables to discriminant analysis

% load fisheriris

%%%%%%%%%%% selection in a table %%%%%%%%%%%%%%%
% i=1;
% M(:,:) selection in a table

% v1 = m.data(:,1:2)

% MdlLinear = fitcdiscr(m.data(:,1:2),m.labels);
% 
% % meanmeas = mean(meas);
% meanclass = predict(MdlLinear,m.data(:,[1 3]))
% i=6;
% M(:,[1 3 i])
% m.labels

%Refer to forward selection in Regression

% T4 = array2table(m.data)

n = input('Enter a number: ');
for c1 = 1:n
    switch c1
        case 1
            disp('negative one')
            i = 5;
            j = 5;

            for c = 1:i% Number of variables
                for r = 1:j% 10 Fold Cross validation
                    disp('negative one');
                    if c == 5
                      break;
                    end
                break;
                end
            break;
            end

        case 2

            disp('negative one')
            i = 2;
            j = 2;
            for c = 1:s
                for r = 1:s
                    disp('Positive');
                end
            end

        case 3

            disp('negative one')
            s = 10;

            for c = 1:s
                for r = 1:s
                   disp('negative one');
                end
            end

        case 4

            disp('negative one')
            s = 10;

            for c = 1:s
                for r = 1:s
                    H(r,c) = 1/(r+c-1);
                end
            end        
        otherwise
            disp('other value')
    end
end