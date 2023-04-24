function predicted_classes = map_classifier(data, class_means, class_covariances)
for sample = 1:length(data.file)
    data_sample = data(sample, :);
    data_sample = [data_sample.F1_ss data_sample.F2_ss data_sample.F3_ss];
    for vowel = 1:height(class_means)
        mean_estimate = table2array(class_means(vowel, :));
        cov_estimate = class_covariances(:, :, vowel);
        p = mvnpdf(data_sample, mean_estimate, cov_estimate);
        likelihoods(:, vowel) = p * 1/12;
    end
    [max_likelihood, max_likelihood_index] = max(likelihoods, [], 2);
    predicted_classes(sample, :) = max_likelihood_index;
end
