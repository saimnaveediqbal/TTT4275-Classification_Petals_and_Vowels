%% Task 2 - GMM model

clc
clear all
[training_set, testing_set, vowel_code, talker_group_code, talker_number, vowel_classes] = prepare_data();
%% (a) Finding GMM models