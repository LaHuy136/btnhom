function avgMFCCResult = averageMFCC(filePath, N_MFCC)
    [x, Fs] = audioread(filePath);
    t_frame = 0.02;
    t_frameShift = 0.01;
    frameSize = t_frame * Fs;
    [leftVowel, rightVowel] = Vowel(x, Fs, t_frame);
    [leftStable, rightStable] = StableSignal(leftVowel, rightVowel);
    stable = x(round(leftStable * frameSize):round(rightStable * frameSize));
    sampleArr = SplitSample(stable, Fs, t_frame);

    MFCC = zeros(size(sampleArr, 1), N_MFCC);
    for i = 1:size(sampleArr, 1)
        MFCC(i,:) = v_melcepst(sampleArr(i,:), Fs, 'm', N_MFCC, floor(3 * log(Fs)), t_frame * Fs, t_frameShift * Fs);
    end

    % Tính giá trị trung bình của tất cả các vectơ đặc trưng
    avgMFCCResult = mean(MFCC, 1);
end
