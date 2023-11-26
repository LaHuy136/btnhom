% b1  phân đoạn voice silence gồm hàm STE Vowel (threshold k cần gán tĩnh 0,02 chạy khảo sát sau)  
% b2  tính vùng ổn định Stable lấy đoạn giữa 
% b3  chia Stable thành  M khung từ đoạn stable của b2 
% b4  viết hàm tính mfcc 
% b5  xuất ra vecto dặc trưng của 1 ng âm cho 1 ng -> cho 21 người
% b6  

% setup



K = [2, 3, 4, 5];
N_MFCC = 13;

% -------------
% tính trung bình MFCC cho 1 nguyên âm 21 người 

filePath = "NguyenAmHuanLuyen-16k\23MTL\e.wav";
a = MFCC(filePath, N_MFCC);

dlmwrite('mfcc_output_23MTL_e.txt',a, 'delimiter', '\t');

x = averageMFCC(filePath,N_MFCC);
Vowels = ['a', 'e', 'i', 'o', 'u'];

RootFolderTest = 'NguyenAmHuanLuyen-16k';
FolderTest = ['23MTL','24FTL', '25MLM', '27MCM', '28MVN', '29MHN', '30FTN', '32MTP','33MHP', '34MQP', '35MMQ', '36MAQ', '37MDS', '38MDS', '39MTS', '40MHS', '41MVS', '42FQT', '43MNT', '44MTT', '45MDV'];
result = zeros(21,13);
for i = 1:1
    for j = 1:21
        FilePath = [RootFolderTest '/' FolderTest((j-1)*5+1 : j*5) '/'  Vowels(i) '.wav'];
        x = averageMFCC(FilePath,N_MFCC);
         result(j, :) = x;
    end
end
result = mean(result,1);
disp(result);

% Hiển thị kết quả


% ------------------
