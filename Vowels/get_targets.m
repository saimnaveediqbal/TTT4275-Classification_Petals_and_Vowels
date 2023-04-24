function targets = get_targets(dataset, vowel_classes)
    targets = NaN(1, size(dataset(:,1), 1));
    filenames = char(dataset.file);
        for i = 1:size(dataset(:,1), 1)
            targets(i) = strmatch(filenames(i, 4:5), vowel_classes);
        end
    targets = targets
end