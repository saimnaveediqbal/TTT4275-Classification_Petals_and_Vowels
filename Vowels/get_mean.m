function class_means = get_mean(dataset, vowel_code)
    vowel_classes = ["ae" "ah" "aw" "eh" "er" "ei" "ih" "iy" "oa" "oo" "uh" "uw"];
    F1 = NaN(12, 1); F2 = F1; F3 = F1;
    class_means = table(F1, F2, F3, RowNames=vowel_classes);
    for vowel = 1:12
        vowel_set = dataset(vowel_code==vowel, :);
        class_means.F1(vowel) = mean(vowel_set.F1_ss);
        class_means.F2(vowel) = mean(vowel_set.F2_ss);
        class_means.F3(vowel) = mean(vowel_set.F3_ss);
    end
end