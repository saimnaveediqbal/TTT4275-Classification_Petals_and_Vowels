function class_covariances = get_cov(dataset, vowel_code)
    vowel_classes = ["ae" "ah" "aw" "eh" "er" "ei" "ih" "iy" "oa" "oo" "uh" "uw"];
    F1 = NaN(12, 1); F2 = F1; F3 = F1;
    class_covariances = table(F1, F2, F3, RowNames=vowel_classes);
    for vowel = 1:12
        vowel_set = dataset(vowel_code==vowel, :);
        class_covariances.F1(vowel) = cov(vowel_set.F1_ss);
        class_covariances.F2(vowel) = cov(vowel_set.F2_ss);
        class_covariances.F3(vowel) = cov(vowel_set.F3_ss);
    end
end