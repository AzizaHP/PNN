close;clc;clear;

%membaca file data train PNN
data_train = readtable('data_train_PNN.txt');
data_train = sortrows(data_train,'label','ascend');
dTrain = table2array(data_train); %convert table to array
x = dTrain(:,1);
y = dTrain(:,2);
z = dTrain(:,3);
dLabelTrain = dTrain(:,4);
save dataTrain.mat dLabelTrain

%menampilkan data ke scatter plot
scatter3(x,y,z,'filled');

%label 0,1,2 di x,y,z
label0=[x(1: 46,1) y(1: 46,1) z(1: 46,1)];      %klasifikasi 0
label1=[x(47: 94,1) y(47: 94,1) z(47: 94,1)];   %klasifikasi 1
label2=[x(95: 150,1) y(95: 150,1) z(95: 150,1)];%klasifikasi 2
xx = [x(1: 46,1)];
yy = [y(1: 46,1)];
zz = [z(1: 46,1)];
                                    
%h=[label0(1: 3,2)] %(baris mulai: data yg diambil,kolom)

jarak0 = [];
jarak1 = [];
jarak2 = [];
tmpMin = [];
%mencari jarak di klasifikasi/label 0 
lbl0 = 0;
for i=1:length(label0),
    for j=1:length(label0),
        if i~=j,
            jarak0 = [jarak0 norm(label0(i,:)-label0(j,:))];
            tmpMin = [sort(jarak0)];
        end
    end
    lbl0 = lbl0+min(jarak0);
end
avgJarak0 = lbl0*(1/length(label0));

%mencari jarak di klasifikasi/label 1 
lbl1 = 0;
for i=1:length(label1),
    for j=1:length(label1),
        if i~=j,
            jarak1 = [jarak1 norm(label1(i,:)-label1(j,:))];
        end
    end
    lbl1 = lbl1+min(jarak1);
end
avgJarak1 = lbl1*(1/length(label1));

%mencari jarak di klasifikasi/label 2
lbl2 = 0;
for i=1:length(label2),
    for j=1:length(label2),
        if i~=j,
            jarak2 = [jarak2 norm(label2(i,:)-label2(j,:))];
        end
    end
    lbl2 = lbl2 + min(jarak2);
end
avgJarak2 = lbl2*(1/length(label2));

g = 0.1; %default nilai error
%mencari nilai tho (smoothing)
tho0 = g*avgJarak0;
tho1 = g*avgJarak1;
tho2 = g*avgJarak2;
%prob = [];
%for i=1:length(label0),
%    tmp=0;
%    sumE = exp();
%    prob = []   