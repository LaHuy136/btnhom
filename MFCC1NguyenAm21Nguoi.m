RootFolderTest = 'NguyenAmHuanLuyen-16k';
RootFolder     = 'NguyenAmKiemThu-16k';

FolderTest = ['23MTL','24FTL', '25MLM', '27MCM', '28MVN', '29MHN', '30FTN', '32MTP','33MHP', '34MQP', '35MMQ', '36MAQ', '37MDS', '38MDS', '39MTS', '40MHS', '41MVS', '42FQT', '43MNT', '44MTT', '45MDV'];
Vowels = ['a', 'e', 'i', 'o', 'u'];
N_MFCC = 13;
% a = 'a';
% MFCC_a = getMFCC1Vowel(RootFolderTest, a, N_MFCC);
% disp(MFCC_a);
% 
% e = 'e';
% MFCC_e = getMFCC1Vowel(RootFolderTest, e, N_MFCC);
% disp(MFCC_e);
% 
% i = 'i';
% MFCC_i = getMFCC1Vowel(RootFolderTest, i, N_MFCC);
% disp(MFCC_i);
% 
% o = 'o';
% MFCC_o = getMFCC1Vowel(RootFolderTest, o, N_MFCC);
% disp(MFCC_o);

% u = 'u';
% MFCC_u = getMFCC1Vowel(RootFolder, u, N_MFCC);
% disp(MFCC_u);

VectorsHuanLuyen = zeros(5,13);
VectorsKiemThu = zeros(5,13);
for i = 1:5
    VectorsHuanLuyen(i, : ) = getMFCC1Vowel(RootFolderTest, Vowels(i), N_MFCC);
    % VowelsKiemThu(i, :)    = getMFCC1Vowel(FolderTest,     Vowels(i), N_MFCC);
end 
figure;
hold on;
for i = 1:5
    plot(VectorsHuanLuyen(i, :), '-o', 'DisplayName', Vowels(i));
end
hold off;

title('Vector Đặc Trưng của Nguyên Âm trong Học và Kiểm Thử');
xlabel('Chỉ Số MFCC');
ylabel('Giá Trị');
legend('show');