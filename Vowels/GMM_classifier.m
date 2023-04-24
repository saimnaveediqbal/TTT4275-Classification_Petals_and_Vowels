function predicted_classes = GMM_classifier(data, GMMs)
    for sample = 1:length(data.file)
        data_sample = data(sample, :);
        data_sample = [data_sample.F1_ss data_sample.F2_ss data_sample.F3_ss];
        for vowel = 1:12
            GMM = GMMs{vowel};
            likelihoods(:, vowel) = pdf(GMM, data_sample) * 1/12;
        end
        [max_likelihood, max_likelihood_index] = max(likelihoods, [], 2);
        predicted_classes(sample, :) = max_likelihood_index;
    end
end
