load dataTrain.mat
data_test = readtable('data_test_PNN.txt');
dTest = table2array(data_test); %convert table to array
x = dTest(:,1);
y = dTest(:,2);
z = dTest(:,3);
save dataTest.mat data_test

PTest = [[-1.23906680200000 1.68879599000000 2.33046295600000]]; %klasifikasi 2, didapat dari data train
%PTest = [1.80688943800000 1.22355699200000 1.51542821400000];

m = 3; %banyaknya klasifikasi/label
g = 0.1; %default nilai error

%probabilitas klasifikasi 0
prob = [];
Hasil = [];
tmp=0;
for i=1:length(label0),
    sumE = exp(-(norm(PTest-label0(i,:)) / (2*(tho0^2))));
    tmp = tmp+sumE;
end
prob = [prob tmp/((2*pi)^(m/1))*(tho0^m)*length(label0)];

%probabilitas klasifikasi 1
tmp=0;
for i=1:length(label1),
    sumE = exp(-(norm(PTest-label1(i,:)) / (2*(tho1^2))));
    tmp = tmp+sumE;
end
prob = [prob tmp/((2*pi)^(m/1))*(tho1^m)*length(label1)];

%probabilitas klasifikasi 2
tmp=0;
for i=1:length(label2),
    sumE = exp(-(norm(PTest-label2(i,:)) / (2*(tho2^2))));
    tmp = tmp+sumE;
end
prob = [prob tmp/((2*pi)^(m/1))*(tho2^m)*length(label2)];

%maksimal probabilitas
probMax = max(prob)

%klasifikasi data
if prob(1,1)==probMax,
    Hasil = ['Klasifikasi 0']
end
if prob(1,2)==probMax,
    Hasil = ['Klasifikasi 1']
end
if prob(1,3)==probMax,
    Hasil = ['Klasifikasi 2']
end