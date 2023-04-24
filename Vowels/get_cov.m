function class_covariances = get_cov(dataset, vowel_code)
    vowel_classes = ["ae" "ah" "aw" "eh" "er" "ei" "ih" "iy" "oa" "oo" "uh" "uw"];
    num_vowels = length(vowel_classes);
    F1 = NaN(num_vowels, 1); F2 = F1; F3 = F1;
    class_covariances = NaN(3, 3, num_vowels);
    cov_mat = NaN(3,3);
    for vowel = 1:num_vowels
        vowel_set = dataset(vowel_code==vowel, :);
        features = [vowel_set.F1_ss vowel_set.F2_ss vowel_set.F3_ss];
        cov_mat = cov(features);
        class_covariances(:,:,vowel) = cov_mat;
    end
end