RootFolder = 'NguyenAmHuanLuyen-16k';
Folder = {'23MTL', '27MCM', '28MVN', '33MHP'};
Vowels = {'a', 'e', 'i', 'o', 'u'};

windowLength = 5 * 10^(-3) * 16000; % 5 ms
stepSize = 3 * 10^(-3) * 16000; % 3 ms

for i = 1:length(Folder)
    currentPersonFolderPath = fullfile(RootFolder, Folder{i});
    figure('Name', Folder{i}, 'NumberTitle', 'off');
    for v = 1:length(Vowels)
        audioFiles = dir(fullfile(currentPersonFolderPath, [Vowels{v}, '*.wav']));
        for j = 1:length(audioFiles)
            audioPath = fullfile(currentPersonFolderPath, audioFiles(j).name);
            [y, Fs] = audioread(audioPath);
            subplot(length(Vowels)*length(audioFiles), 1, (v-1)*length(audioFiles) + j); 
            spectrogram(y, windowLength, stepSize, 1024, Fs, 'yaxis');
            title(['Wideband Spectrogram ' audioFiles(j).name], 'Interpreter', 'none');
        end
    end
end
