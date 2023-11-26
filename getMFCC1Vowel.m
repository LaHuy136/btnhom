function [result] = getMFCC1Vowel(Root, vowel, N_MFCC)
    Folder1 = ['01MDA', '02FVA', '03MAB', '04MHB', '05MVB', '06FTB', '07FTC', '08MLD', '09MPD', '10MSD', '11MVD', '12FTD', '14FHH', '15MMH', '16FTH', '17MTH', '18MNK', '19MXK','20MVK', '21MTL', '22MHL'];
    Folder2 = ['23MTL','24FTL', '25MLM', '27MCM', '28MVN', '29MHN', '30FTN', '32MTP','33MHP', '34MQP', '35MMQ', '36MAQ', '37MDS', '38MDS', '39MTS', '40MHS', '41MVS', '42FQT', '43MNT', '44MTT', '45MDV'];
    Folder = [];
    if     (strcmp(Root,'NguyenAmKiemThu-16k'))  
        Folder = Folder1; 
    elseif (strcmp(Root,'NguyenAmHuanLuyen-16k'))
        Folder = Folder2;
    end

    result = zeros(21,13);    
    for j = 1:21
        FilePath = [Root '/' Folder((j-1)*5+1 : j*5) '/'  vowel '.wav'];
        x = averageMFCC(FilePath,N_MFCC);
        result(j, :) = x;        
    end
    result = mean(result,1);
    % disp(result);
  
end