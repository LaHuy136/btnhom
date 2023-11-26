% Đường dẫn đến thư mục chính
RootFolder = 'NguyenAmHuanLuyen-16k';
Folder = {'23MTL', '27MCM', '28MVN', '33MHP'};
Vowels = {'a', 'e', 'i', 'o', 'u'};

% Độ dài cửa sổ và bước giữa cửa sổ
%windowLength = 5 * 10^(-3) * 16000; % 5 ms
stepSize = 3 * 10^(-3) * 16000; % 3 ms

% Vòng lặp qua từng thư mục con (đại diện cho mỗi người)
for i = 1:length(Folder)
    % Đường dẫn đầy đủ đến thư mục của người nói hiện tại
    currentPersonFolderPath = fullfile(RootFolder, Folder{i});
    
    % Tạo một figure cho mỗi người nói
    figure('Name', Folder{i}, 'NumberTitle', 'off');
    
    % Vòng lặp qua từng nguyên âm
    for v = 1:length(Vowels)
        % Lấy tất cả các tệp âm thanh trong thư mục của người nói hiện tại và nguyên âm hiện tại
        audioFiles = dir(fullfile(currentPersonFolderPath, [Vowels{v}, '*.wav']));
        
        % Vòng lặp qua từng tệp âm thanh của người nói hiện tại và nguyên âm hiện tại
        for j = 1:length(audioFiles)
            % Đường dẫn đầy đủ đến tệp âm thanh
            audioPath = fullfile(currentPersonFolderPath, audioFiles(j).name);
            
            % Sử dụng audioread để đọc tệp âm thanh
            [y, Fs] = audioread(audioPath);
            
            % Tạo subplot cho mỗi tệp âm thanh
            subplot(length(Vowels)*length(audioFiles), 2, (v-1)*length(audioFiles)*2 + 2*j-1); % wideband spectrogram
            spectrogram(y, windowLength, stepSize, 1024, Fs, 'yaxis');
            title(['Wideband Spectrogram ' audioFiles(j).name], 'Interpreter', 'none');
            
            % Lấy giá trị trung bình của tín hiệu
            meanValue = mean(y);
            
            % Trừ giá trị trung bình từ tín hiệu để có biên độ 0 ở giữa
            y_centered = y - meanValue;
            
            % Tạo subplot cho mỗi tệp âm thanh
            subplot(length(Vowels)*length(audioFiles), 2, (v-1)*length(audioFiles)*2 + 2*j); % audio signal
            plot((1:length(y))/Fs, y_centered, 'b', 'LineWidth', 1.5);
            title(['Audio Signal ' audioFiles(j).name], 'Interpreter', 'none'); % Hiển thị tên file
            xlabel('Time (s)');
            ylabel('Amplitude');
        end
    end
end
