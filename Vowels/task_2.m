%% Task 2 - GMM model

clc
clear all
[training_set, testing_set, vowel_code, talker_group_code, talker_number, vowel_classes] = prepare_data();
%% (a) Finding GMM models
for vowel = 1:12
    vowel_set = training_set(vowel_code==vowel, :);
    vowel_set = table2array(vowel_set(:, ["F1_ss" "F2_ss" "F3_ss"]))
    GMM = fitgmdist(vowel_set, 2, 'RegularizationValue', 0.0001, 'CovarianceType', 'diagonal');
end