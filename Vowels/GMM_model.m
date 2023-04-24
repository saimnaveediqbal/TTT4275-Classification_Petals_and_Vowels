function GMMs = GMM_model(dataset, vowel_code, order)
    GMMs = cell(1, 12);
    for vowel = 1:12
        vowel_set = dataset(vowel_code==vowel, :);
        vowel_set = table2array(vowel_set(:, ["F1_ss" "F2_ss" "F3_ss"]));
        GMMs{vowel} = fitgmdist(vowel_set, order, 'RegularizationValue', 0.0001, 'CovarianceType', 'diagonal'); 
    end
    GMMs = GMMs;
end