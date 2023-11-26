% setup

RootFolder = 'NguyenAmHuanLuyen-16k';
Folder = ['01MDA', '02FVA', '03MAB', '04MHB', '05MVB', '06FTB', '07FTC', '08MLD', '09MPD', '10MSD', '11MVD', '12FTD', '14FHH', '15MMH', '16FTH', '17MTH', '18MNK', '19MXK','20MVK', '21MTL', '22MHL' ];
Vowels = ['a', 'e', 'i', 'o', 'u'];

RootFolderTest = 'NguyenAmKiemThu-16k';
FolderTest = ['23MTL','24FTL', '25MLM', '27MCM', '28MVN', '29MHN', '30FTN', '32MTP','33MHP', '34MQP', '35MMQ', '36MAQ', '37MDS', '38MDS', '39MTS', '40MHS', '41MVS', '42FQT', '43MNT', '44MTT', '45MDV'];

color = ['g', 'b', 'r', 'm', 'k'];

K = [2, 3, 4, 5];
N_MFCC = [13, 26, 39];

% -------------




[x, Fs] = audioread('a.wav');

% Đặt độ dài của mỗi khung là 0.025 giây
t_frame = 0.025;

% Gọi hàm Vowel để xác định khoảng nguyên âm
[left, right] = Vowel(x, Fs, t_frame);

% Hiển thị tín hiệu âm thanh và khoảng nguyên âm trên đồ thị
figure;
subplot(3, 1, 1);
plot(x);
title('Tín hiệu âm thanh');
xlabel('Thời gian (mẫu)');
ylabel('Amplitude');

subplot(3, 1, 2);
plot(x);
hold on;
plot([left * t_frame * Fs, left * t_frame * Fs], ylim, 'r--', 'LineWidth', 2);
plot([right * t_frame * Fs, right * t_frame * Fs], ylim, 'r--', 'LineWidth', 2);
disp(left * t_frame * Fs + " " + right * t_frame * Fs);
hold off;
title('Khoảng nguyên âm được xác định');
xlabel('Thời gian (mẫu)');
ylabel('Amplitude');
legend('Tín hiệu', 'Khoảng nguyên âm');


% Sử dụng hàm StableSignal để xác định khoảng ổn định
[leftStable, rightStable] = StableSignal(left,  right);
subplot(3,1,3) 
plot(x);
hold on;
plot([leftStable * t_frame * Fs, leftStable * t_frame * Fs], ylim, 'r--', 'LineWidth', 2);
plot([rightStable * t_frame * Fs, rightStable * t_frame * Fs], ylim, 'r--', 'LineWidth', 2);
disp(leftStable+ " "+ rightStable);
hold off;
title('Khoảng ổn định được xác định');
xlabel('Thời gian (mẫu)');
ylabel('Amplitude');
legend('Tín hiệu', 'Khoảng ổn định');

% % ------------------------------------




