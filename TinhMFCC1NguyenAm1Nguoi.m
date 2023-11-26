
% -------------
% tính trung bình MFCC cho 1 nguyên âm 1 người 
N_MFCC = 13;
filePath = "NguyenAmHuanLuyen-16k\23MTL\e.wav";
x = averageMFCC(filePath,N_MFCC);

