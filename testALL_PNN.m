load dataTrain.mat  %membuka klasifikasi data train
load dataTest.mat   %membuka data_test_PNN
data_test = readtable('data_test_PNN.txt');
dTest = table2array(data_test); %convert table to array
x = dTest(:,1);
y = dTest(:,2);
z = dTest(:,3);

g = 0.1;            %konstanta standar error
m = 3;              %banyaknya klasifikasi
sumClass = length(PTest(:,1));       
   
truee = 0;
probAll = [];
maxProb = 0;
Hasil = [];
for iProb=1:length(dTest),
    tmp=0;
    PTest = dTest(iProb,:);
    
    %Probabilitas klasifikasi 0
    for k0=1:length(label0),
        sumE = exp(-(norm(PTest-label0(k0,:)) / (2*(tho0^2))));
        tmp = tmp+sumE;
    end
    probAll = [probAll tmp/((2*pi)^(m/1))*(tho0^m)*length(label0);];
    
    %Probabilitas klasifikasi 1
    for k0=1:length(label1),
        sumE = exp(-(norm(PTest-label1(k0,:)) / (2*(tho1^2))));
        tmp = tmp+sumE;
    end
    probAll = [probAll tmp/((2*pi)^(m/1))*(tho1^m)*length(label1);];
    
    %Probabilitas klasifikasi 2
    for k0=1:length(label2),
        sumE = exp(-(norm(PTest-label2(k0,:)) / (2*(tho2^2))));
        tmp = tmp+sumE;
    end
    probAll = [probAll tmp/((2*pi)^(m/1))*(tho2^m)*length(label2);];
    
    %Max Probabilitas
    probMax = max(probAll);
    %klasifikasi data  
    if probAll(1,1)==probMax,
        Hasil = ['Klasifikasi 0']
    end
    if probAll(1,2)==probMax,
        Hasil = ['Klasifikasi 1']
    end
    if probAll(1,3)==probMax,
        Hasil = ['Klasifikasi 2']
    end
    
    file = fopen('hasilTest.txt','w'); %membuka file yang akan ditulis
    %fprintf(file, [Hasil 'r\n']);
    fprintf(file, '%f r\n',[Hasil]);
    fclose(file);true
end    

