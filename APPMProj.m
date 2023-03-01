%Nick Larson

clear;
clc;

%%
%Least squares example in Background
A0=[1 -1 0;0 1 -1;-1 0 1];
b0=[14;3;6];
r0=lsqr(A0,b0);

%%
%Code for example in Version 1 of Keener's Method
A1=[0 1/2 1/4;0 0 1/4;1/4 1/4 0];
[evec1,eval1]=eig(A1);

%Convert diagnal matrix eval1 to a vector with the eigenvalues
eval11=zeros(1,length(eval1));
for i=1:length(eval1)
   eval11(1,i)=eval1(i,i);
end

%Find the max eigenvalue and corresponding eigenvector (ranking vector)
lambda1=max(eval11);

for i=1:length(eval11)
   if eval11(1,i)==lambda1
       ind1=i;
   end
end

r1=evec1(:,ind1);

%Ensure r1 has all positive components instead of all negative components
if r1(1)<0
    r1=r1*-1;
end

%%
%Code for example in Version 2 of Keener's Method
A2=[0 0.1869 0.1235;0.0631 0 0.1006;0.1264 0.1493 0];
[evec2,eval2]=eig(A2);

%Convert diagnal matrix eval2 to a vector with the eigenvalues
eval22=zeros(1,length(eval2));
for i=1:length(eval2)
   eval22(1,i)=eval2(i,i);
end

%Find the max eigenvalue and corresponding eigenvector (ranking vector)
lambda2=max(eval22);

for i=1:length(eval22)
   if eval22(1,i)==lambda2
       ind2=i;
   end
end

r2=evec2(:,ind2);

%Ensure r2 has all positive components instead of all negative components
if r2(1)<0
    r2=r2*-1;
end

%%
%Example for Colley's method
C=[6 -2 -2;-2 6 -2;-2 -2 6];
b=[2;0;1];
r3=linsolve(C,b);

%%
%Load Data for 2020 NFL season to do a comparison with all three methods
Table=readtable('MatMethodsProjData.csv');
Table=Table(:,2:5);
Data=table2cell(Table);

%Create a mat with just the scores
ScoresMat=zeros(length(Data),2);
for i=1:length(Data)
   ScoresMat(i,1)=Data{i,2}; 
   ScoresMat(i,2)=Data{i,3}; 
end


%%
%Ranking of NFL teams using Keener version 1

%Assign teams a number 1-32
TeamsVec=cell(32,1);
for i=1:16
   TeamsVec(i)=Data(i,1);
   TeamsVec(i+16)=Data(i,4);
end

%Replace names of team with associated number
DataTeams=zeros(256,2);
for j=1:2
    for i=1:256
        for k=1:32
            if j==1
                if length(Data{i,1})==length(TeamsVec{k})
                    if Data{i,1}==TeamsVec{k}
                        DataTeams(i,1)=k;
                    end
                end
            else
                if length(Data{i,4})==length(TeamsVec{k})
                    if Data{i,4}==TeamsVec{k}
                        DataTeams(i,2)=k;
                    end
                end
            end
        end
    end
end

%Combine DataTeams and ScoresMat
DataMat=[DataTeams(:,1) ScoresMat(:,1) ScoresMat(:,2) DataTeams(:,2)];

%Create A Matrix
AK1=zeros(32);
for i=1:256
    if DataMat(i,2)>DataMat(i,3)
        AK1(DataMat(i,1),DataMat(i,4))=AK1(DataMat(i,1),DataMat(i,4))+1;
    end
    if DataMat(i,3)>DataMat(i,2)
        AK1(DataMat(i,4),DataMat(i,1))=AK1(DataMat(i,4),DataMat(i,1))+1;
    end
end
AK1=AK1/16;

%Find evals and evecs
[evecK1,evalK1]=eig(AK1);

%Convert evalK1 to a vector
evalK11=zeros(1,length(evalK1));
for i=1:length(evalK1)
    evalK11(i)=evalK1(i,i);
end

%Find max eigenvalue and corresponding eigenvector
lambdaK1=max(evalK11);

for i=1:length(evalK11)
   if evalK11(i)==lambdaK1
       indK1=i;
   end
end

rK1=evecK1(:,indK1);

%Ensure ranking vector is positive
if rK1(1)<0
    rK1=rK1*-1;
end

%Sort teams from highest to lowest ranking
sortedrK1=sort(rK1,'descend');
rK1Matsorted=zeros(32,2);
rK1Matsorted(:,2)=sortedrK1;

for i=1:32
    for j=1:32
        if sortedrK1(i)==rK1(j)
            rK1Matsorted(i,1)=j;
        end
    end
end

FinalrK1=cell(32,3);

for i=1:32
    FinalrK1{i,1}=i;
    FinalrK1{i,3}=rK1Matsorted(i,2);
    FinalrK1{i,2}=TeamsVec(rK1Matsorted(i,1));
end

FinalrK1=cell2table(FinalrK1);
FinalrK1.Properties.VariableNames={'Rank','Team','r_ij'};
%%
%Ranking NFL teams using Keener version 2

%Create A matrix
numAK2=zeros(32);
for i=1:256
    for j=1:32
       if DataMat(i,1)==j
          numAK2(DataMat(i,1),DataMat(i,4))=numAK2(DataMat(i,1),DataMat(i,4))+DataMat(i,2);
       end
       if DataMat(i,4)==j
          numAK2(DataMat(i,4),DataMat(i,1))=numAK2(DataMat(i,4),DataMat(i,1))+DataMat(i,3);
       end
    end
end

denAK2=zeros(32);
for i=1:256
    for j=1:32
        if DataMat(i,1)==j
            denAK2(DataMat(i,1),DataMat(i,4))=denAK2(DataMat(i,1),DataMat(i,4))+DataMat(i,3)+DataMat(i,2);
        end
        if DataMat(i,4)==j
            denAK2(DataMat(i,4),DataMat(i,1))=denAK2(DataMat(i,4),DataMat(i,1))+DataMat(i,3)+DataMat(i,2);
        end
    end
end

%Add one to numerator and two to denominator
for i=1:32
    for j=1:32
        if numAK2(i,j)>0
           numAK2(i,j)=numAK2(i,j)+1; 
        end
           denAK2(i,j)=denAK2(i,j)+2;
    end
end

%Form AK2 mat
AK2=zeros(32);
for i=1:32
    for j=1:32
        AK2(i,j)=numAK2(i,j)/denAK2(i,j);
    end
end
AK2=AK2/16;

%Find evals and evecs
[evecK2,evalK2]=eig(AK2);

%Convert evalK1 to a vector
evalK22=zeros(1,length(evalK2));
for i=1:length(evalK2)
    evalK22(i)=evalK2(i,i);
end

%Find max eigenvalue and corresponding eigenvector
lambdaK2=max(evalK22);

for i=1:length(evalK22)
   if evalK22(i)==lambdaK2
       indK2=i;
   end
end

rK2=evecK2(:,indK2);

%Ensure ranking vector is positive
if rK2(1)<0
    rK2=rK2*-1;
end

%Sort teams from highest to lowest ranking
sortedrK2=sort(rK2,'descend');
rK2Matsorted=zeros(32,2);
rK2Matsorted(:,2)=sortedrK2;

for i=1:32
    for j=1:32
        if sortedrK2(i)==rK2(j)
            rK2Matsorted(i,1)=j;
        end
    end
end

FinalrK2=cell(32,3);

for i=1:32
    FinalrK2{i,1}=i;
    FinalrK2{i,3}=rK2Matsorted(i,2);
    FinalrK2{i,2}=TeamsVec(rK2Matsorted(i,1));
end

FinalrK2=cell2table(FinalrK2);
FinalrK2.Properties.VariableNames={'Rank','Team','r_ij'};

%%
%Ranking of NFL teams using Colley's method

%Create C matrix
C=zeros(32);

AK1ref=AK1*16;

for i=1:32
    for j=1:32
        if i==j
            C(i,j)=18;
        else
            C(i,j)=-AK1ref(i,j);
        end
    end
end

%Create b1 vec
bC=zeros(32,1);
wC=zeros(32,1);
lC=zeros(32,1);

for i=1:256
        if DataMat(i,2)>DataMat(i,3)
            wC(DataMat(i,1))=wC(DataMat(i,1))+1;
            lC(DataMat(i,4))=lC(DataMat(i,4))+1;
        end
        if DataMat(i,3)>DataMat(i,2)
            wC(DataMat(i,4))=wC(DataMat(i,4))+1;
            lC(DataMat(i,1))=lC(DataMat(i,1))+1;
        end
end

for i=1:32
    bC(i)=((wC(i)-lC(i))/2)+1;
end

%Solve for ranking vector
rC=linsolve(C,bC);

%Sort teams from highest to lowest ranking
sortedrC=sort(rC,'descend');
rCMatsorted=zeros(32,2);
rCMatsorted(:,2)=sortedrC;

for i=1:32
    for j=1:32
        if sortedrC(i)==rC(j)
            rCMatsorted(i,1)=j;
        end
    end
end

FinalrC=cell(32,3);

for i=1:32
    FinalrC{i,1}=i;
    FinalrC{i,3}=rCMatsorted(i,2);
    FinalrC{i,2}=TeamsVec(rCMatsorted(i,1));
end

FinalrC=cell2table(FinalrC);
FinalrC.Properties.VariableNames={'Rank','Team','r_ij'};

