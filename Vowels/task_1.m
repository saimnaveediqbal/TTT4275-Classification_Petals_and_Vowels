clc
clear all
[training_set, testing_set, vowel_code, talker_group_code, talker_number] = prepare_data();
%%
class_means = get_mean(training_set, vowel_code);
class_covariances = get_cov(training_set, vowel_code);